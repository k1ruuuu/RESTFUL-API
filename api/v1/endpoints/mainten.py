from fastapi import APIRouter, Depends, HTTPException, status
from schemas.mainten import MaintenResponse, MaintenUpdate, MaintenInDB
from crud.mainten import crud_mainten
from api.v1.endpoints.auth import get_current_user, get_current_developer
import logging

logger = logging.getLogger(__name__)

router = APIRouter(prefix="/mainten", tags=["maintenance"])


@router.get("/1", response_model=MaintenResponse)
async def get_maintenance_status(
    current_user: dict = Depends(get_current_user)   # semua user yang sudah login
):
    """
    GET status maintenance saat ini.
    Diakses oleh semua user (polling setiap 30 detik dari frontend).
    """
    data = crud_mainten.get()
    if not data:
        raise HTTPException(
            status_code=status.HTTP_404_NOT_FOUND,
            detail="Data maintenance tidak ditemukan. Jalankan SQL seed terlebih dahulu."
        )
    return data


@router.put("/1", response_model=MaintenInDB)
async def update_maintenance_status(
    payload: MaintenUpdate,
    current_user: dict = Depends(get_current_developer)  # developer only
):
    """
    PUT update status maintenance.
    Hanya developer yang bisa mengubah status maintenance.

    Body (semua opsional):
    - status: bool — true = aktifkan maintenance, false = matikan
    - message: str — pesan yang ditampilkan ke user saat maintenance
    """
    updated = crud_mainten.update(
        status=payload.status,
        message=payload.message,
        updated_by=current_user.get("username"),
    )
    if not updated:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="Gagal mengupdate status maintenance"
        )

    action = "diaktifkan" if updated.get("status") else "dimatikan"
    logger.info(f"[Maintenance] {action} oleh {current_user.get('username')}")

    return updated