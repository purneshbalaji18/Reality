"""
ANTIGRAVITY — End-to-End Pipeline Test
=======================================
Tests the /api/v1/scan/text endpoint with real Indian product ingredient lists.
Requires the FastAPI server to be running on localhost:8000.

Usage:
    python test_pipeline.py
"""

import httpx
import asyncio
import sys
import json

BASE_URL = "http://localhost:8000"

# ──────────────────────────────────────────────────────────────
# TEST CASES — Real Indian product ingredient lists
# ──────────────────────────────────────────────────────────────

TEST_CASES = [
    {
        "name": "Glow & Lovely Advanced Multivitamin Face Cream",
        "ingredients": (
            "Water, Stearic Acid, Ethylhexyl Methoxycinnamate, Isopropyl Myristate, "
            "Glyceryl Stearate, Niacinamide, Cetyl Alcohol, Glycerin, Phenoxyethanol, "
            "Sodium Hydroxide, Titanium Dioxide, Methylparaben, Propylparaben, "
            "Fragrance, BHT, Dimethicone, Triethanolamine, EDTA"
        )
    },
    {
        "name": "Colgate Strong Teeth Toothpaste",
        "ingredients": (
            "Calcium Carbonate, Water, Sorbitol, Sodium Lauryl Sulfate, "
            "Sodium Monofluorophosphate, Cellulose Gum, Sodium Silicate, "
            "Sodium Saccharin, Sodium Benzoate, Titanium Dioxide, "
            "Fragrance, Triclosan"
        )
    },
    {
        "name": "Maggi 2-Minute Masala Noodles",
        "ingredients": (
            "Wheat Flour, Palm Oil, Salt, Mineral (Iron), "
            "Flavour Enhancer (INS 621), Sugar, Onion Powder, "
            "Dehydrated Vegetables, Acidity Regulator (INS 338), "
            "Thickener (508), Colour (INS 102), Colour (INS 110), "
            "Antioxidant (INS 319), Preservative (INS 211)"
        )
    }
]


async def run_test(test_case: dict, index: int) -> bool:
    """Run a single text scan test and print results."""
    name = test_case["name"]
    ingredients = test_case["ingredients"]

    print(f"\n{'=' * 60}")
    print(f"  TEST {index + 1}: {name}")
    print(f"{'=' * 60}")

    try:
        async with httpx.AsyncClient(timeout=60.0) as client:
            response = await client.post(
                f"{BASE_URL}/api/v1/scan/text",
                json={"raw_ingredient_text": ingredients}
            )

        if response.status_code != 200:
            print(f"  [FAIL] HTTP {response.status_code}")
            print(f"  Response: {response.text[:300]}")
            return False

        data = response.json()

        if not data.get("success"):
            print(f"  [FAIL] API returned success=false")
            print(f"  Response: {json.dumps(data, indent=2)[:500]}")
            return False

        # Extract results
        overall_harm = data.get("overall_harm_level", "unknown")
        tox = data.get("toxicology_summary", {})
        ing_list = data.get("ingredients", [])
        resolved = sum(1 for i in ing_list if i.get("is_resolved"))
        total = len(ing_list)

        # Flagged ingredients (moderate/high/critical)
        flagged = [
            i for i in ing_list
            if i.get("harm_level") in ("moderate", "high", "critical")
            and i.get("is_resolved")
        ]

        # Clinical explanation first sentence
        clinical = tox.get("clinical_explanation", "")
        first_sentence = clinical.split(". ")[0] + "." if clinical else "N/A"

        # Print results
        print(f"  Overall Harm   : {overall_harm.upper()}")
        print(f"  Resolved       : {resolved}/{total} ingredients")
        print(f"  Flagged ({len(flagged)})    :")
        for f in flagged:
            harm_badge = f"[{f['harm_level'].upper()}]"
            canonical = f.get("matched_canonical_name") or f.get("raw_name_on_label")
            summary = (f.get("harm_summary") or "")[:80]
            print(f"    {harm_badge:12s} {canonical} - {summary}")

        print(f"  Clinical (1st) : {first_sentence[:120]}")
        print(f"\n  [PASS]")
        return True

    except httpx.ConnectError:
        print(f"  [FAIL] Cannot connect to {BASE_URL}")
        print(f"  Make sure the server is running: uvicorn app.main:app --reload")
        return False
    except Exception as e:
        print(f"  [FAIL] Exception: {e}")
        return False


async def main():
    """Run all test cases sequentially."""
    print("\n" + "-" * 60)
    print("  ANTIGRAVITY -- END-TO-END PIPELINE TEST")
    print("-" * 60)

    # Health check first
    try:
        async with httpx.AsyncClient(timeout=10.0) as client:
            health = await client.get(f"{BASE_URL}/health")
            h = health.json()
            print(f"  Server         : [OK] Healthy ({h.get('environment', 'unknown')})")
            print(f"  Alias cache    : {h.get('alias_cache_count', '?')} aliases")
            print(f"  Supabase       : {'[OK]' if h.get('supabase_connected') else '[--]'}")
    except Exception:
        print(f"  Server         : [--] Cannot reach {BASE_URL}")
        print(f"  Aborting tests.")
        sys.exit(1)

    results = []
    for i, test in enumerate(TEST_CASES):
        passed = await run_test(test, i)
        results.append(passed)

    # Summary
    passed_count = sum(results)
    total = len(results)
    print(f"\n{'=' * 60}")
    print(f"  RESULTS: {passed_count}/{total} PASSED")
    if passed_count == total:
        print(f"  All tests passed!")
    else:
        print(f"  {total - passed_count} test(s) failed.")
    print(f"{'=' * 60}\n")

    sys.exit(0 if passed_count == total else 1)


if __name__ == "__main__":
    asyncio.run(main())
