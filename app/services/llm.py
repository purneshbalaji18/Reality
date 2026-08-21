import httpx
from typing import List, Dict, Any
from app.config import settings
from app.schemas.scan import AnalyzedIngredient, ToxicologySummary


SYSTEM_PROMPT = """You are the Senior Clinical Toxicologist and Organic Chemist for Antigravity — India's premier product safety intelligence platform.

CRITICAL OPERATIONAL RULES:
1. Grounding Guarantee: You MUST ONLY explain and contextualize toxicology facts provided in the DATABASE PAYLOAD below.
2. NO Hallucination: Do NOT invent LD50 values, NOAEL numbers, carcinogen ratings, or health risks beyond what the knowledge base provides.
3. Tone: Authoritative, clinical, precise, yet plain-English readable for consumers.
4. Structure: Provide a brief clinical toxicology breakdown (under 3 paragraphs) summarizing:
   - Overall product harm assessment
   - Critical & high risk ingredients identified
   - Vulnerable population warnings (pregnant women, infants, asthmatics, children)
   - Notable India vs. EU regulatory discrepancies
"""


class LLMService:
    """Groq API (Llama 3.3 70B primary) + Gemini API fallback analysis layer"""

    async def generate_toxicology_summary(
        self,
        raw_text: str,
        ingredients: List[AnalyzedIngredient]
    ) -> ToxicologySummary:
        # Calculate counts
        critical_cnt = sum(1 for i in ingredients if i.harm_level == "critical")
        high_cnt = sum(1 for i in ingredients if i.harm_level == "high")
        mod_cnt = sum(1 for i in ingredients if i.harm_level == "moderate")
        safe_cnt = sum(1 for i in ingredients if i.harm_level == "safe")

        # Determine overall harm level
        if critical_cnt > 0:
            overall_harm = "critical"
        elif high_cnt > 0:
            overall_harm = "high"
        elif mod_cnt > 0:
            overall_harm = "moderate"
        elif safe_cnt > 0 and (critical_cnt + high_cnt + mod_cnt) == 0:
            overall_harm = "safe"
        else:
            overall_harm = "low"

        # Count India vs EU gaps
        gap_cnt = sum(
            1 for ing in ingredients
            for reg in ing.regulatory_statuses
            if reg.is_india_eu_gap
        )

        # Collect vulnerable population warnings
        vulnerability_warnings = []
        for ing in ingredients:
            for vul in ing.vulnerabilities:
                msg = f"[{ing.matched_canonical_name or ing.raw_name_on_label}] {vul.population_group.upper()}: {vul.reason}"
                if msg not in vulnerability_warnings:
                    vulnerability_warnings.append(msg)

        # Collect organ targets
        organ_targets = []
        for ing in ingredients:
            for ot in ing.organ_targets:
                if ot.organ_system not in organ_targets:
                    organ_targets.append(ot.organ_system)

        # Construct database payload for LLM
        db_payload = {
            "overall_harm": overall_harm,
            "counts": {"critical": critical_cnt, "high": high_cnt, "moderate": mod_cnt, "safe": safe_cnt},
            "ingredients": [
                {
                    "name": ing.matched_canonical_name or ing.raw_name_on_label,
                    "harm_level": ing.harm_level,
                    "summary": ing.harm_summary,
                    "mechanism": ing.mechanism_description,
                    "carcinogen_class": ing.carcinogen_class,
                    "endocrine_disruptor": ing.endocrine_disruptor,
                    "regulatory_gaps": [r.dict() for r in ing.regulatory_statuses if r.is_india_eu_gap]
                }
                for ing in ingredients if ing.is_resolved
            ]
        }

        # Attempt Groq LLM invocation
        clinical_text = await self._call_groq(db_payload)

        # Fallback if Groq unavailable or key not set
        if not clinical_text:
            clinical_text = await self._call_gemini(db_payload)

        # Rule-based fallback if no API key is provided in environment
        if not clinical_text:
            clinical_text = self._rule_based_fallback(db_payload)

        return ToxicologySummary(
            overall_harm_level=overall_harm,
            critical_ingredients_count=critical_cnt,
            high_ingredients_count=high_cnt,
            moderate_ingredients_count=mod_cnt,
            safe_ingredients_count=safe_cnt,
            india_eu_regulatory_gaps_count=gap_cnt,
            clinical_explanation=clinical_text,
            vulnerable_population_warnings=vulnerability_warnings,
            key_organ_targets_affected=organ_targets
        )

    async def _call_groq(self, payload: Dict[str, Any]) -> Optional[str]:
        if not settings.groq_api_key:
            return None

        url = "https://api.groq.com/openai/v1/chat/completions"
        headers = {
            "Authorization": f"Bearer {settings.groq_api_key}",
            "Content-Type": "application/json"
        }
        body = {
            "model": "llama-3.3-70b-versatile",
            "messages": [
                {"role": "system", "content": SYSTEM_PROMPT},
                {"role": "user", "content": f"DATABASE PAYLOAD:\n{payload}"}
            ],
            "temperature": 0.2
        }

        async with httpx.AsyncClient(timeout=10.0) as client:
            try:
                resp = await client.post(url, json=body, headers=headers)
                if resp.status_code == 200:
                    return resp.json()["choices"][0]["message"]["content"]
            except Exception as e:
                print(f"[LLMService] Groq API call failed: {e}")
        return None

    async def _call_gemini(self, payload: Dict[str, Any]) -> Optional[str]:
        if not settings.gemini_api_key:
            return None

        url = f"https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key={settings.gemini_api_key}"
        body = {
            "contents": [{
                "parts": [{"text": f"{SYSTEM_PROMPT}\n\nDATABASE PAYLOAD:\n{payload}"}]
            }]
        }

        async with httpx.AsyncClient(timeout=10.0) as client:
            try:
                resp = await client.post(url, json=body)
                if resp.status_code == 200:
                    return resp.json()["candidates"][0]["content"]["parts"][0]["text"]
            except Exception as e:
                print(f"[LLMService] Gemini API call failed: {e}")
        return None

    def _rule_based_fallback(self, payload: Dict[str, Any]) -> str:
        harm = payload["overall_harm"].upper()
        counts = payload["counts"]
        ing_list = payload["ingredients"]

        resolved_names = [i["name"] for i in ing_list]
        names_str = ", ".join(resolved_names) if resolved_names else "unresolved compounds"

        summary = f"CLINICAL EVALUATION ({harm} HARM RATING):\n"
        summary += f"Analyzed ingredients include: {names_str}. "
        summary += f"Found {counts['critical']} critical, {counts['high']} high, and {counts['moderate']} moderate hazard components.\n\n"

        gaps = [g for i in ing_list for g in i.get("regulatory_gaps", [])]
        if gaps:
            summary += f"REGULATORY DISCREPANCY WARNING: Identified {len(gaps)} discrepancy between Indian (FSSAI/CDSCO) regulations and European Union (EU) standards. "

        return summary


llm_service = LLMService()
