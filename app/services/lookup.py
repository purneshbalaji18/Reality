import re
from typing import List, Dict, Any, Optional
from app.db.supabase import supabase_manager
from app.schemas.scan import (
    AnalyzedIngredient,
    OrganTargetImpact,
    VulnerabilityImpact,
    RegulatoryStatusItem
)


# Memory fallback dictionary based on our 51-ingredient seed database
SEED_INGREDIENT_CACHE: Dict[str, Dict[str, Any]] = {
    "methylparaben": {
        "id": "a0000000-0000-4000-a000-000000000001",
        "canonical_name": "Methylparaben",
        "harm_level": "low",
        "harm_summary": "Widely used preservative. Low risk of mild skin sensitization in sensitive individuals.",
        "mechanism_description": "Weak estrogenic receptor binding; rapidly metabolized to p-hydroxybenzoic acid.",
        "carcinogen_class": None,
        "endocrine_disruptor": True,
        "bioaccumulation": False,
        "organ_targets": [{"organ_system": "skin", "effect_type": "sensitization", "severity": "mild"}],
        "vulnerabilities": [{"population_group": "eczema_patients", "risk_level": "moderate", "risk_multiplier": 1.5, "reason": "Disrupted skin barrier increases absorption and contact dermatitis risk."}],
        "regulatory": [
            {"authority_code": "CDSCO", "authority_name": "CDSCO (India)", "country": "IN", "verdict": "approved_restricted", "max_concentration_pct": 0.4, "restriction_notes": "Max 0.4% single, 0.8% total parabens in cosmetics.", "regulation_ref": "IS 4707:2001", "is_india_eu_gap": False},
            {"authority_code": "EU", "authority_name": "European Union (EFSA/SCCS)", "country": "EU", "verdict": "approved_restricted", "max_concentration_pct": 0.4, "restriction_notes": "Max 0.4% single ester.", "regulation_ref": "EC/1223/2009/Annex-V/12", "is_india_eu_gap": False}
        ]
    },
    "propylparaben": {
        "id": "a0000000-0000-4000-a000-000000000002",
        "canonical_name": "Propylparaben",
        "harm_level": "moderate",
        "harm_summary": "Preservative with endocrine disruption potential. Restricted in EU leave-on baby products.",
        "mechanism_description": "Binds estrogen receptors; longer alkyl chain increases affinity compared to methylparaben.",
        "carcinogen_class": None,
        "endocrine_disruptor": True,
        "bioaccumulation": False,
        "organ_targets": [{"organ_system": "endocrine", "effect_type": "estrogenic_disruption", "severity": "moderate"}],
        "vulnerabilities": [{"population_group": "infants", "risk_level": "high", "risk_multiplier": 2.0, "reason": "Immature metabolic enzymes reduce paraben clearance."}],
        "regulatory": [
            {"authority_code": "CDSCO", "authority_name": "CDSCO (India)", "country": "IN", "verdict": "approved_restricted", "max_concentration_pct": 0.14, "restriction_notes": "Max 0.14% in cosmetics.", "regulation_ref": "IS 4707:2001", "is_india_eu_gap": False},
            {"authority_code": "EU", "authority_name": "European Union (EFSA/SCCS)", "country": "EU", "verdict": "approved_restricted", "max_concentration_pct": 0.14, "restriction_notes": "Banned in leave-on diaper products for children under 3.", "regulation_ref": "EU/2014/358", "is_india_eu_gap": True}
        ]
    },
    "dmdm hydantoin": {
        "id": "a0000000-0000-4000-a000-000000000006",
        "canonical_name": "DMDM Hydantoin",
        "harm_level": "high",
        "harm_summary": "Formaldehyde-releasing preservative. High risk of contact allergy and hair/scalp irritation.",
        "mechanism_description": "Slowly decomposes in aqueous solution to release free formaldehyde gas.",
        "carcinogen_class": None,
        "endocrine_disruptor": False,
        "bioaccumulation": False,
        "organ_targets": [{"organ_system": "skin", "effect_type": "contact_dermatitis", "severity": "high"}, {"organ_system": "respiratory", "effect_type": "irritation", "severity": "moderate"}],
        "vulnerabilities": [{"population_group": "asthma_patients", "risk_level": "high", "risk_multiplier": 2.5, "reason": "Inhaled formaldehyde triggers bronchospasm."}],
        "regulatory": [
            {"authority_code": "CDSCO", "authority_name": "CDSCO (India)", "country": "IN", "verdict": "not_evaluated", "max_concentration_pct": None, "restriction_notes": "No specific formaldehyde releaser limits in India.", "regulation_ref": None, "is_india_eu_gap": True},
            {"authority_code": "EU", "authority_name": "European Union (EFSA/SCCS)", "country": "EU", "verdict": "approved_restricted", "max_concentration_pct": 0.2, "restriction_notes": "Max 0.2% free HCHO. Must label 'contains formaldehyde' if >0.05%.", "regulation_ref": "EC/1223/2009/Annex-V/13", "is_india_eu_gap": True}
        ]
    },
    "hydroquinone": {
        "id": "a0000000-0000-4000-a000-000000000023",
        "canonical_name": "Hydroquinone",
        "harm_level": "critical",
        "harm_summary": "Potent skin lightener. Causes exogenous ochronosis (permanent skin darkening) and potential organ toxicity.",
        "mechanism_description": "Inhibits tyrosinase enzyme, preventing melanin synthesis; toxic to melanocytes.",
        "carcinogen_class": "group_3",
        "endocrine_disruptor": False,
        "bioaccumulation": False,
        "organ_targets": [{"organ_system": "skin", "effect_type": "ochronosis", "severity": "severe"}, {"organ_system": "liver", "effect_type": "hepatotoxicity", "severity": "high"}],
        "vulnerabilities": [{"population_group": "pregnant_women", "risk_level": "critical", "risk_multiplier": 3.0, "reason": "High systemic absorption (up to 45%) poses fetal exposure risk."}],
        "regulatory": [
            {"authority_code": "CDSCO", "authority_name": "CDSCO (India)", "country": "IN", "verdict": "approved_restricted", "max_concentration_pct": 2.0, "restriction_notes": "Prescription only (2%). OTC enforcement gaps exist.", "regulation_ref": "Drugs & Cosmetics Act", "is_india_eu_gap": True},
            {"authority_code": "EU", "authority_name": "European Union (EFSA/SCCS)", "country": "EU", "verdict": "banned", "max_concentration_pct": None, "restriction_notes": "Banned in cosmetic products entirely.", "regulation_ref": "EC/1223/2009/Annex-II/1339", "is_india_eu_gap": True}
        ]
    },
    "titanium dioxide": {
        "id": "a0000000-0000-4000-a000-000000000036",
        "canonical_name": "Titanium Dioxide",
        "harm_level": "moderate",
        "harm_summary": "Banned as a food additive in EU (E171) due to potential genotoxicity. Safe as topical sunscreen.",
        "mechanism_description": "Inhaled or ingested nanoparticles cause oxidative stress and DNA strand breaks.",
        "carcinogen_class": "group_2b",
        "endocrine_disruptor": False,
        "bioaccumulation": True,
        "organ_targets": [{"organ_system": "gastrointestinal", "effect_type": "genotoxicity", "severity": "high"}],
        "vulnerabilities": [{"population_group": "children", "risk_level": "high", "risk_multiplier": 2.0, "reason": "Higher relative oral intake from candies/biscuits per body weight."}],
        "regulatory": [
            {"authority_code": "FSSAI", "authority_name": "FSSAI (India)", "country": "IN", "verdict": "approved", "max_concentration_pct": None, "restriction_notes": "Permitted food colour INS 171.", "regulation_ref": "FSS Regulations 2011", "is_india_eu_gap": True},
            {"authority_code": "EU", "authority_name": "European Union (EFSA/SCCS)", "country": "EU", "verdict": "banned", "max_concentration_pct": None, "restriction_notes": "BANNED as food additive (E171) since Feb 2022.", "regulation_ref": "EU/2022/63", "is_india_eu_gap": True}
        ]
    },
    "triclosan": {
        "id": "a0000000-0000-4000-a000-000000000025",
        "canonical_name": "Triclosan",
        "harm_level": "high",
        "harm_summary": "Antibacterial chemical that disrupts thyroid hormones and contributes to antibiotic resistance.",
        "mechanism_description": "Inhibits bacterial enoyl-acyl carrier protein reductase; bioaccumulates and disrupts endocrine signaling.",
        "carcinogen_class": None,
        "endocrine_disruptor": True,
        "bioaccumulation": True,
        "organ_targets": [{"organ_system": "endocrine", "effect_type": "thyroid_disruption", "severity": "high"}],
        "vulnerabilities": [{"population_group": "pregnant_women", "risk_level": "high", "risk_multiplier": 2.2, "reason": "Thyroid hormone disruption alters fetal neurodevelopment."}],
        "regulatory": [
            {"authority_code": "CDSCO", "authority_name": "CDSCO (India)", "country": "IN", "verdict": "not_evaluated", "max_concentration_pct": None, "restriction_notes": "No specific restriction in Indian soaps or toothpastes.", "regulation_ref": None, "is_india_eu_gap": True},
            {"authority_code": "EU", "authority_name": "European Union (EFSA/SCCS)", "country": "EU", "verdict": "approved_restricted", "max_concentration_pct": 0.3, "restriction_notes": "Max 0.3% in rinse-off soaps/toothpaste only. Banned in leave-on.", "regulation_ref": "EU/2014/358", "is_india_eu_gap": True}
        ]
    },
    "tartrazine": {
        "id": "a0000000-0000-4000-a000-000000000012",
        "canonical_name": "Tartrazine",
        "harm_level": "moderate",
        "harm_summary": "Synthetic azo food dye (INS 102). Triggers hyperactivity in children and hives in asthmatics.",
        "mechanism_description": "Histamine release trigger; azoreductase intestinal metabolism produces sulfanilic acid.",
        "carcinogen_class": None,
        "endocrine_disruptor": False,
        "bioaccumulation": False,
        "organ_targets": [{"organ_system": "immune", "effect_type": "urticaria", "severity": "moderate"}],
        "vulnerabilities": [{"population_group": "children", "risk_level": "high", "risk_multiplier": 2.0, "reason": "Linked to ADHD and hyperactivity symptoms in pediatric studies."}],
        "regulatory": [
            {"authority_code": "FSSAI", "authority_name": "FSSAI (India)", "country": "IN", "verdict": "approved_restricted", "max_concentration_pct": None, "restriction_notes": "Permitted food colour INS 102.", "regulation_ref": "FSS Regulations 2011", "is_india_eu_gap": False},
            {"authority_code": "EU", "authority_name": "European Union (EFSA/SCCS)", "country": "EU", "verdict": "approved_restricted", "max_concentration_pct": None, "restriction_notes": "Mandatory warning: 'May have an adverse effect on activity and attention in children.'", "regulation_ref": "EC/1333/2008/Annex-V", "is_india_eu_gap": True}
        ]
    },
    "msg": {
        "id": "a0000000-0000-4000-a000-000000000018",
        "canonical_name": "Monosodium Glutamate",
        "harm_level": "safe",
        "harm_summary": "Naturally occurring amino acid salt. Generally safe; Chinese Restaurant Syndrome claims unsubstantiated.",
        "mechanism_description": "Activates umami taste receptors (TAS1R1/TAS1R3) on tongue.",
        "carcinogen_class": None,
        "endocrine_disruptor": False,
        "bioaccumulation": False,
        "organ_targets": [],
        "vulnerabilities": [],
        "regulatory": [
            {"authority_code": "FSSAI", "authority_name": "FSSAI (India)", "country": "IN", "verdict": "approved", "max_concentration_pct": None, "restriction_notes": "Permitted flavour enhancer INS 621.", "regulation_ref": "FSS Regulations 2011", "is_india_eu_gap": False},
            {"authority_code": "EU", "authority_name": "European Union (EFSA/SCCS)", "country": "EU", "verdict": "approved", "max_concentration_pct": None, "restriction_notes": "Approved quantum satis.", "regulation_ref": "EC/1333/2008", "is_india_eu_gap": False}
        ]
    }
}

# Alias map for instant normalization
ALIAS_MAP: Dict[str, str] = {
    "ins 102": "tartrazine",
    "e102": "tartrazine",
    "yellow 5": "tartrazine",
    "ins 171": "titanium dioxide",
    "e171": "titanium dioxide",
    "ins 211": "sodium benzoate",
    "ins 202": "potassium sorbate",
    "ins 621": "msg",
    "ins 319": "tbhq",
    "ins 338": "phosphoric acid",
    "dmdm": "dmdm hydantoin",
    "parfum": "fragrance",
    "perfume": "fragrance",
    "sls": "sodium lauryl sulfate",
    "sles": "sodium laureth sulfate"
}


class LookupService:
    """Ingredient Resolution & Knowledge Base Lookup Engine"""

    def parse_raw_text(self, text: str) -> List[str]:
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

    def resolve_ingredient(self, raw_name: str) -> AnalyzedIngredient:
        norm_name = raw_name.lower().strip()
        
        # Check alias map
        if norm_name in ALIAS_MAP:
            norm_name = ALIAS_MAP[norm_name]

        # Query memory cache
        if norm_name in SEED_INGREDIENT_CACHE:
            data = SEED_INGREDIENT_CACHE[norm_name]

            organ_targets = [OrganTargetImpact(**ot) for ot in data.get("organ_targets", [])]
            vulnerabilities = [VulnerabilityImpact(**v) for v in data.get("vulnerabilities", [])]
            regulatory = [RegulatoryStatusItem(**r) for r in data.get("regulatory", [])]

            return AnalyzedIngredient(
                raw_name_on_label=raw_name,
                matched_canonical_name=data["canonical_name"],
                ingredient_id=data["id"],
                matched_by_alias=raw_name if raw_name.lower() != data["canonical_name"].lower() else None,
                harm_level=data["harm_level"],
                harm_summary=data["harm_summary"],
                mechanism_description=data["mechanism_description"],
                carcinogen_class=data["carcinogen_class"],
                endocrine_disruptor=data["endocrine_disruptor"],
                bioaccumulation=data["bioaccumulation"],
                organ_targets=organ_targets,
                vulnerabilities=vulnerabilities,
                regulatory_statuses=regulatory,
                is_resolved=True
            )

        # Unresolved fallback
        return AnalyzedIngredient(
            raw_name_on_label=raw_name,
            matched_canonical_name=None,
            ingredient_id=None,
            harm_level="unknown",
            is_resolved=False
        )


lookup_service = LookupService()
