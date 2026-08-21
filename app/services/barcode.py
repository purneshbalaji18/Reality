import httpx
from typing import Optional, Dict, Any


class BarcodeService:
    """Open Food Facts API Barcode Resolver"""

    OFF_API_URL = "https://world.openfoodfacts.org/api/v2/product/{barcode}.json"

    async def fetch_product_by_barcode(self, barcode: str) -> Optional[Dict[str, Any]]:
        clean_barcode = barcode.strip().replace(" ", "")
        url = self.OFF_API_URL.format(barcode=clean_barcode)

        async with httpx.AsyncClient(timeout=10.0) as client:
            try:
                response = await client.get(
                    url,
                    headers={"User-Agent": "AntigravitySafetyApp/1.0 (safety-intelligence@antigravity.in)"}
                )
                if response.status_code != 200:
                    return None

                data = response.json()
                if data.get("status") != 1:
                    return None

                product = data.get("product", {})
                
                # Extract best available ingredients text
                ingredients_text = (
                    product.get("ingredients_text_en") or
                    product.get("ingredients_text") or
                    product.get("ingredients_text_with_allergens_en") or
                    ""
                )

                return {
                    "barcode": clean_barcode,
                    "name": product.get("product_name") or product.get("product_name_en"),
                    "brand": product.get("brands"),
                    "raw_ingredient_text": ingredients_text,
                    "categories": product.get("categories"),
                    "found": True
                }

            except Exception as e:
                print(f"[BarcodeService] Error querying Open Food Facts: {e}")
                return None


barcode_service = BarcodeService()
