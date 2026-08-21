from typing import List, Optional, Dict, Any
from pydantic import BaseModel, Field


class BarcodeScanRequest(BaseModel):
    barcode: str = Field(..., description="EAN-13 or UPC barcode string")


class TextScanRequest(BaseModel):
    raw_ingredient_text: str = Field(..., description="Raw ingredient label text string")


class VulnerabilityImpact(BaseModel):
    population_group: str
    risk_level: str
    risk_multiplier: float
    reason: str


class OrganTargetImpact(BaseModel):
    organ_system: str
    effect_type: str
    severity: str


class RegulatoryStatusItem(BaseModel):
    authority_code: str
    authority_name: str
    country: str
    verdict: str
    max_concentration_pct: Optional[float] = None
    restriction_notes: Optional[str] = None
    regulation_ref: Optional[str] = None
    is_india_eu_gap: bool = False


class AnalyzedIngredient(BaseModel):
    raw_name_on_label: str
    matched_canonical_name: Optional[str] = None
    ingredient_id: Optional[str] = None
    matched_by_alias: Optional[str] = None
    harm_level: str = "unknown"
    harm_summary: Optional[str] = None
    mechanism_description: Optional[str] = None
    carcinogen_class: Optional[str] = None
    endocrine_disruptor: Optional[bool] = None
    bioaccumulation: Optional[bool] = None
    organ_targets: List[OrganTargetImpact] = []
    vulnerabilities: List[VulnerabilityImpact] = []
    regulatory_statuses: List[RegulatoryStatusItem] = []
    is_resolved: bool = False


class ProductInfo(BaseModel):
    name: Optional[str] = None
    brand: Optional[str] = None
    barcode: Optional[str] = None
    category_slug: Optional[str] = None


class ToxicologySummary(BaseModel):
    overall_harm_level: str  # critical, high, moderate, low, safe, unknown
    critical_ingredients_count: int = 0
    high_ingredients_count: int = 0
    moderate_ingredients_count: int = 0
    safe_ingredients_count: int = 0
    india_eu_regulatory_gaps_count: int = 0
    clinical_explanation: str
    vulnerable_population_warnings: List[str] = []
    key_organ_targets_affected: List[str] = []


class ScanResponse(BaseModel):
    success: bool
    source: str  # barcode, ocr, text
    product: Optional[ProductInfo] = None
    raw_text: str
    resolved_count: int
    unresolved_count: int
    ingredients: List[AnalyzedIngredient]
    toxicology_summary: ToxicologySummary
