import re
import logging
from typing import List, Dict, Any, Optional
from app.db.supabase import supabase_manager
from app.schemas.scan import (
    AnalyzedIngredient,
    OrganTargetImpact,
    VulnerabilityImpact,
    RegulatoryStatusItem
)

logger = logging.getLogger("antigravity.lookup")


class LookupService:
    """Ingredient Resolution & Knowledge Base Lookup Engine.
    
    Architecture:
    - On startup, warm_cache() loads ALL ingredient_aliases into memory.
    - resolve_ingredient() does instant dict lookup for alias → ingredient_id.
    - Full ingredient profile fetched from Supabase only for resolved matches.
    - If Supabase is unavailable, falls back to unresolved gracefully.
    """

    def __init__(self):
        # In-memory alias cache: alias_name (lowered) → ingredient UUID string
        self._alias_cache: Dict[str, str] = {}
        # In-memory profile cache: ingredient UUID string → base AnalyzedIngredient
        self._profile_cache: Dict[str, AnalyzedIngredient] = {}
        self._cache_warmed: bool = False

    # ------------------------------------------------------------------
    # STARTUP CACHE
    # ------------------------------------------------------------------

    async def warm_cache(self) -> None:
        """Load ALL rows from ingredient_aliases table into memory.
        Called once on FastAPI startup event.
        Key: alias_name.lower().strip()
        Value: ingredient_id (UUID string)
        """
        client = supabase_manager.get_client()
        if not client:
            logger.warning("[LookupService] Supabase not available — alias cache NOT loaded. Running with empty cache.")
            return

        try:
            response = client.table("ingredient_aliases").select("alias_name, ingredient_id").execute()
            rows = response.data or []

            for row in rows:
                alias = row.get("alias_name", "").lower().strip()
                ingredient_id = row.get("ingredient_id", "")
                if alias and ingredient_id:
                    self._alias_cache[alias] = ingredient_id

            self._cache_warmed = True
            logger.info(f"Alias cache warmed: {len(self._alias_cache)} aliases loaded")

        except Exception as e:
            logger.error(f"[LookupService] Failed to warm alias cache: {e}")

    def get_cache_count(self) -> int:
        """Return the number of aliases currently in the cache."""
        return len(self._alias_cache)

    def is_cache_warmed(self) -> bool:
        """Return whether the cache has been successfully warmed."""
        return self._cache_warmed

    # ------------------------------------------------------------------
    # TEXT PARSING
    # ------------------------------------------------------------------

    def parse_raw_text(self, text: str) -> List[str]:
        """Tokenize raw ingredient label text into individual ingredient names."""
        if not text:
            return []

        # Clean text
        clean = re.sub(r'[\r\n]+', ' ', text)
        clean = re.sub(r'\(.*?\)', '', clean)  # Remove sub-parentheses for raw token split

        # Split by comma, semicolon, bullet, or colon
        tokens = re.split(r'[,;•\:]', clean)

        results = []
        for t in tokens:
            t_clean = t.strip()
            if len(t_clean) > 2 and not t_clean.isnumeric():
                results.append(t_clean)

        return results

    # ------------------------------------------------------------------
    # INGREDIENT RESOLUTION
    # ------------------------------------------------------------------

    def resolve_ingredient(self, raw_name: str) -> AnalyzedIngredient:
        """Resolve a raw ingredient name against the alias cache and Supabase.
        Uses in-memory profile caching for ultra-fast performance.
        """
        norm_name = raw_name.lower().strip()

        # Step 1: Check alias cache
        ingredient_id = self._alias_cache.get(norm_name)

        if not ingredient_id:
            # Not found in alias cache → unresolved
            return AnalyzedIngredient(
                raw_name_on_label=raw_name,
                matched_canonical_name=None,
                ingredient_id=None,
                harm_level="unknown",
                is_resolved=False
            )

        # Step 2: Check in-memory profile cache
        if ingredient_id in self._profile_cache:
            base_profile = self._profile_cache[ingredient_id]
            # Copy profile with current raw_name_on_label
            return AnalyzedIngredient(
                raw_name_on_label=raw_name,
                matched_canonical_name=base_profile.matched_canonical_name,
                ingredient_id=base_profile.ingredient_id,
                harm_level=base_profile.harm_level,
                harm_summary=base_profile.harm_summary,
                mechanism_description=base_profile.mechanism_description,
                carcinogen_class=base_profile.carcinogen_class,
                endocrine_disruptor=base_profile.endocrine_disruptor,
                organ_targets=base_profile.organ_targets,
                vulnerabilities=base_profile.vulnerabilities,
                regulatory_statuses=base_profile.regulatory_statuses,
                is_resolved=True
            )

        # Step 2: Fetch full ingredient profile from Supabase
        client = supabase_manager.get_client()
        if not client:
            logger.warning(f"[LookupService] Supabase unavailable — cannot fetch profile for '{raw_name}'")
            return AnalyzedIngredient(
                raw_name_on_label=raw_name,
                matched_canonical_name=None,
                ingredient_id=ingredient_id,
                harm_level="unknown",
                is_resolved=False
            )

        try:
            return self._fetch_full_profile(client, raw_name, ingredient_id)
        except Exception as e:
            logger.error(f"[LookupService] Error fetching profile for '{raw_name}' (id={ingredient_id}): {e}")
            return AnalyzedIngredient(
                raw_name_on_label=raw_name,
                matched_canonical_name=None,
                ingredient_id=ingredient_id,
                harm_level="unknown",
                is_resolved=False
            )

    def _fetch_full_profile(self, client, raw_name: str, ingredient_id: str) -> AnalyzedIngredient:
        """Fetch ingredient + organ_targets + vulnerabilities + regulatory_status from Supabase."""

        # 3. Fetch ingredient base data
        ing_resp = client.table("ingredients").select("*").eq("id", ingredient_id).execute()
        ing_rows = ing_resp.data or []

        if not ing_rows:
            return AnalyzedIngredient(
                raw_name_on_label=raw_name,
                matched_canonical_name=None,
                ingredient_id=ingredient_id,
                harm_level="unknown",
                is_resolved=False
            )

        ing = ing_rows[0]

        # 4. Fetch organ targets
        organ_targets = []
        try:
            ot_resp = client.table("ingredient_organ_targets").select("*").eq("ingredient_id", ingredient_id).execute()
            for ot in (ot_resp.data or []):
                organ_targets.append(OrganTargetImpact(
                    organ_system=ot.get("organ_system", "unknown"),
                    effect_type=ot.get("effect_description") or ot.get("effect_type", "unknown"),
                    severity=ot.get("severity", "low")
                ))
        except Exception as e:
            logger.error(f"[LookupService] Failed to fetch organ targets for {ingredient_id}: {e}")

        # 5. Fetch vulnerabilities
        vulnerabilities = []
        try:
            vul_resp = client.table("ingredient_vulnerabilities").select("*").eq("ingredient_id", ingredient_id).execute()
            for v in (vul_resp.data or []):
                vulnerabilities.append(VulnerabilityImpact(
                    population_group=v.get("population_group", "general"),
                    risk_level=v.get("risk_level") or "moderate",
                    risk_multiplier=float(v.get("risk_multiplier", 1.0)),
                    reason=v.get("explanation") or v.get("reason", "")
                ))
        except Exception as e:
            logger.error(f"[LookupService] Failed to fetch vulnerabilities for {ingredient_id}: {e}")

        # 6. Fetch regulatory status
        regulatory = []
        try:
            reg_resp = client.table("regulatory_status").select(
                "*, regulatory_authorities(code, full_name, country)"
            ).eq("ingredient_id", ingredient_id).execute()

            for r in (reg_resp.data or []):
                auth = r.get("regulatory_authorities") or {}
                regulatory.append(RegulatoryStatusItem(
                    authority_code=auth.get("code") or r.get("authority_code", ""),
                    authority_name=auth.get("full_name") or r.get("authority_name", ""),
                    country=auth.get("country") or r.get("country", ""),
                    verdict=r.get("verdict", "not_evaluated"),
                    max_concentration_pct=r.get("max_concentration_pct"),
                    restriction_notes=r.get("restriction_notes"),
                    regulation_ref=r.get("regulation_ref"),
                    is_india_eu_gap=r.get("is_india_eu_gap", False)
                ))
        except Exception as e:
            logger.error(f"[LookupService] Failed to fetch regulatory status for {ingredient_id}: {e}")

        # 7. Build and return AnalyzedIngredient
        canonical_name = ing.get("canonical_name", raw_name)

        profile = AnalyzedIngredient(
            raw_name_on_label=raw_name,
            matched_canonical_name=canonical_name,
            ingredient_id=ingredient_id,
            matched_by_alias=raw_name if raw_name.lower().strip() != canonical_name.lower().strip() else None,
            harm_level=ing.get("harm_level", "unknown"),
            harm_summary=ing.get("description"),            # column is 'description' in DB
            mechanism_description=ing.get("mechanism_of_harm"),  # column is 'mechanism_of_harm' in DB
            carcinogen_class=ing.get("carcinogen_class"),
            endocrine_disruptor=ing.get("endocrine_disruptor", False),
            bioaccumulation=ing.get("bioaccumulation", False),
            organ_targets=organ_targets,
            vulnerabilities=vulnerabilities,
            regulatory_statuses=regulatory,
            is_resolved=True
        )

        self._profile_cache[ingredient_id] = profile
        return profile


lookup_service = LookupService()
