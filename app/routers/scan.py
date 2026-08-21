from fastapi import APIRouter, UploadFile, File, HTTPException, status
from app.schemas.scan import (
    BarcodeScanRequest,
    TextScanRequest,
    ScanResponse,
    ProductInfo
)
from app.services.barcode import barcode_service
from app.services.ocr import ocr_service
from app.services.lookup import lookup_service
from app.services.llm import llm_service


router = APIRouter(prefix="/api/v1/scan", tags=["Product Safety Scan"])


@router.post("/barcode", response_model=ScanResponse)
async def scan_barcode(request: BarcodeScanRequest):
    """Scan product by EAN-13 / UPC Barcode via Open Food Facts API & DB Lookup"""
    off_data = await barcode_service.fetch_product_by_barcode(request.barcode)
    
    if not off_data or not off_data.get("raw_ingredient_text"):
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail=f"Product barcode {request.barcode} not found in Open Food Facts or lacks raw ingredient text."
        )

    raw_text = off_data["raw_ingredient_text"]
    product_info = ProductInfo(
        name=off_data.get("name"),
        brand=off_data.get("brand"),
        barcode=off_data.get("barcode"),
        category_slug=off_data.get("categories")
    )

    return await _process_ingredient_analysis(raw_text, source="barcode", product_info=product_info)


@router.post("/text", response_model=ScanResponse)
async def scan_text(request: TextScanRequest):
    """Scan product from raw ingredient label text string"""
    if not request.raw_ingredient_text.strip():
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Raw ingredient text cannot be empty."
        )

    return await _process_ingredient_analysis(request.raw_ingredient_text, source="text")


@router.post("/ocr", response_model=ScanResponse)
async def scan_ocr(file: UploadFile = File(...)):
    """Scan product from uploaded image of ingredient list label (Tesseract OCR)"""
    if not file.content_type.startswith("image/"):
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="File uploaded must be a valid image (JPEG, PNG, WEBP)."
        )

    image_bytes = await file.read()
    extracted_text = ocr_service.process_image_bytes(image_bytes)

    if not extracted_text:
        raise HTTPException(
            status_code=status.HTTP_422_UNPROCESSABLE_ENTITY,
            detail="Could not extract readable text from image. Please ensure packaging label is clear."
        )

    return await _process_ingredient_analysis(extracted_text, source="ocr")


async def _process_ingredient_analysis(
    raw_text: str,
    source: str,
    product_info: ProductInfo = None
) -> ScanResponse:
    # 1. Tokenize raw text
    tokens = lookup_service.parse_raw_text(raw_text)

    # 2. Resolve each token against knowledge base
    analyzed_ingredients = [lookup_service.resolve_ingredient(t) for t in tokens]

    resolved_count = sum(1 for i in analyzed_ingredients if i.is_resolved)
    unresolved_count = len(analyzed_ingredients) - resolved_count

    # 3. Generate clinical toxicology summary via Groq / Gemini / rule fallback
    toxicology_summary = await llm_service.generate_toxicology_summary(
        raw_text=raw_text,
        ingredients=analyzed_ingredients
    )

    return ScanResponse(
        success=True,
        source=source,
        product=product_info,
        raw_text=raw_text,
        resolved_count=resolved_count,
        unresolved_count=unresolved_count,
        ingredients=analyzed_ingredients,
        toxicology_summary=toxicology_summary
    )
