import os
import logging
import shutil
from contextlib import asynccontextmanager

from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from fastapi.staticfiles import StaticFiles

from app.routers import scan
from app.config import settings
from app.db.supabase import supabase_manager
from app.services.lookup import lookup_service

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s | %(name)-28s | %(levelname)-5s | %(message)s",
    datefmt="%H:%M:%S"
)
logger = logging.getLogger("antigravity.main")


# ------------------------------------------------------------------
# STARTUP / SHUTDOWN LIFESPAN
# ------------------------------------------------------------------

@asynccontextmanager
async def lifespan(app: FastAPI):
    """FastAPI lifespan: runs startup checks before serving requests."""
    await _run_startup_checks()
    yield
    logger.info("Antigravity backend shutting down.")


async def _run_startup_checks():
    """Run all startup diagnostics and warm the alias cache."""

    line = "-" * 43

    # 1. Supabase connection
    sb_client = supabase_manager.get_client()
    sb_status = "[OK] Connected" if sb_client else "[--] Not connected (seed-memory fallback)"

    # 2. Warm alias cache
    await lookup_service.warm_cache()
    alias_count = lookup_service.get_cache_count()
    alias_status = f"[OK] {alias_count} aliases loaded" if alias_count > 0 else "[--] Empty (Supabase unavailable?)"

    # 3. Ingredient count from Supabase
    ing_count = 0
    if sb_client:
        try:
            resp = sb_client.table("ingredients").select("id", count="exact").execute()
            ing_count = resp.count if hasattr(resp, 'count') and resp.count else len(resp.data or [])
        except Exception as e:
            logger.warning(f"Could not count ingredients: {e}")
    ing_status = f"[OK] {ing_count} in database" if ing_count > 0 else "[--] 0 (check seeds)"

    # 4. API keys
    groq_status = "[OK] Key present" if settings.groq_api_key else "[--] Key not set (fallback to Gemini)"
    gemini_status = "[OK] Key present" if settings.gemini_api_key else "[--] Key not set (rule-based fallback)"

    # 5. Tesseract OCR binary
    tesseract_path = shutil.which("tesseract")
    ocr_status = f"[OK] Binary found ({tesseract_path})" if tesseract_path else "[--] Not found (OCR disabled)"

    # Print startup banner
    print(f"""
{line}
  ANTIGRAVITY BACKEND -- STARTUP CHECK
{line}
  Supabase      : {sb_status}
  Alias cache   : {alias_status}
  Ingredients   : {ing_status}
  Groq API      : {groq_status}
  Gemini API    : {gemini_status}
  Tesseract OCR : {ocr_status}
{line}
""")


# ------------------------------------------------------------------
# APP INITIALIZATION
# ------------------------------------------------------------------

app = FastAPI(
    title="Antigravity — Product Safety Intelligence API",
    description="Clinical toxicology and ingredient safety platform for the Indian market.",
    version="1.0.0_mvp",
    lifespan=lifespan
)

# Configure CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Register Routers
app.include_router(scan.router)


@app.get("/health")
def health_check():
    return {
        "status": "healthy",
        "environment": settings.environment,
        "alias_cache_count": lookup_service.get_cache_count(),
        "supabase_connected": supabase_manager.get_client() is not None
    }


# Mount static files (ensure app/static directory exists)
static_dir = os.path.join(os.path.dirname(__file__), "static")
if os.path.exists(static_dir):
    app.mount("/", StaticFiles(directory=static_dir, html=True), name="static")


if __name__ == "__main__":
    import uvicorn
    uvicorn.run("app.main:app", host="0.0.0.0", port=settings.port, reload=True)
