from fastapi import APIRouter, HTTPException
from pydantic import BaseModel
from datetime import datetime
import psutil

router = APIRouter()

class HealthResponse(BaseModel):
    status: str
    timestamp: datetime
    version: str = "1.0.0"
    uptime: float = None

@router.get("/health", response_model=HealthResponse)
async def health_check():
    """Health check endpoint"""
    return HealthResponse(
        status="healthy",
        timestamp=datetime.utcnow(),
        version="1.0.0",
        uptime=psutil.Process().create_time()
    )

@router.get("/health/live")
async def liveness():
    """Liveness probe for Kubernetes"""
    return {"status": "alive"}

@router.get("/health/ready")
async def readiness():
    """Readiness probe for Kubernetes"""
    return {"status": "ready"}