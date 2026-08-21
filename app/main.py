from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware
from fastapi.staticfiles import StaticFiles
import os
from app.routers import scan
from app.config import settings

app = FastAPI(
    title="Antigravity — Product Safety Intelligence API",
    description="Clinical toxicology and ingredient safety platform for the Indian market.",
    version="1.0.0_mvp"
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
        "environment": settings.environment
    }

# Mount static files (ensure app/static directory exists)
static_dir = os.path.join(os.path.dirname(__file__), "static")
if os.path.exists(static_dir):
    app.mount("/", StaticFiles(directory=static_dir, html=True), name="static")


if __name__ == "__main__":
    import uvicorn
    uvicorn.run("app.main:app", host="0.0.0.0", port=settings.port, reload=True)

