import asyncio
from app.schemas.scan import TextScanRequest
from app.routers.scan import scan_text


async def main():
    print("Testing Antigravity Text Scan Endpoint...")
    sample_text = "Water, Niacinamide, Glycerin, Titanium Dioxide, Phenoxyethanol, Methylparaben, Propylparaben, DMDM Hydantoin, Hydroquinone"
    
    req = TextScanRequest(raw_ingredient_text=sample_text)
    res = await scan_text(req)
    
    print(f"Success: {res.success}")
    print(f"Source: {res.source}")
    print(f"Resolved Count: {res.resolved_count} / {len(res.ingredients)}")
    print(f"Overall Harm Level: {res.toxicology_summary.overall_harm_level.upper()}")
    print(f"Critical Count: {res.toxicology_summary.critical_ingredients_count}")
    print(f"High Count: {res.toxicology_summary.high_ingredients_count}")
    print(f"India vs EU Regulatory Gaps: {res.toxicology_summary.india_eu_regulatory_gaps_count}")
    print("\n--- Clinical Toxicology Explanation ---")
    print(res.toxicology_summary.clinical_explanation)


if __name__ == "__main__":
    asyncio.run(main())
