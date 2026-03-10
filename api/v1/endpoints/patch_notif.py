from fastapi import APIRouter, Depends, HTTPException, status, Query
from typing import List, Optional
from schemas.patch_notif import (
    PatchNotifCreate, PatchNotifInDB, PatchNotifActiveResponse
)
from crud.patch_notif import crud_patch_notif
from api.v1.endpoints.auth import get_current_user, get_current_developer, get_current_admin
import logging

logger = logging.getLogger(__name__)

router = APIRouter(prefix="/patch_notif", tags=["patch notification"])


@router.get("/active", response_model=Optional[PatchNotifActiveResponse])
async def get_active_patch(
    current_user: dict = Depends(get_current_user)   # semua user yang sudah login
):
    """
    GET patch notif yang sedang aktif.
    Diakses semua user — frontend polling tiap 60 detik untuk cek update baru.
    Return null jika tidak ada patch aktif.
    """
    data = crud_patch_notif.get_active()
    if not data:
        return None
    return data


@router.get("/", response_model=List[PatchNotifInDB])
async def get_all_patches(
    limit: int = Query(50, ge=1, le=200),
    offset: int = Query(0, ge=0),
    current_user: dict = Depends(get_current_admin)  # admin + developer
):
    """
    GET semua riwayat patch notif.
    Hanya untuk admin & developer (history).
    """
    return crud_patch_notif.get_all(limit=limit, offset=offset)


@router.post("/", response_model=PatchNotifInDB, status_code=status.HTTP_201_CREATED)
async def create_patch(
    payload: PatchNotifCreate,
    current_user: dict = Depends(get_current_developer)  # developer only
):
    """
    POST buat patch notif baru.
    Jika is_active=True (default), semua patch aktif lama akan dinonaktifkan.
    Patch baru langsung tampil ke semua user saat mereka polling.
    """
    new_patch = crud_patch_notif.create(
        title=payload.title,
        subtitle=payload.subtitle,
        message=payload.message,
        bug_url=payload.bug_url,
        is_active=payload.is_active,
        created_by=current_user.get("username"),
    )
    if not new_patch:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="Gagal membuat patch notification"
        )

    logger.info(f"[PatchNotif] Dibuat oleh {current_user.get('username')}: '{payload.title}'")
    return new_patch


@router.delete("/{patch_id}", status_code=status.HTTP_200_OK)
async def deactivate_patch(
    patch_id: int,
    current_user: dict = Depends(get_current_developer)  # developer only
):
    """
    DELETE (soft) — nonaktifkan patch notif berdasarkan ID.
    Data tidak dihapus dari database, hanya is_active diset 0.
    """
    patch = crud_patch_notif.get_by_id(patch_id)
    if not patch:
        raise HTTPException(status_code=status.HTTP_404_NOT_FOUND, detail="Patch tidak ditemukan")

    success = crud_patch_notif.deactivate(patch_id)
    if not success:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Gagal menonaktifkan patch (mungkin sudah nonaktif)"
        )

    logger.info(f"[PatchNotif] ID {patch_id} dinonaktifkan oleh {current_user.get('username')}")
    return {"message": f"Patch '{patch.get('title')}' berhasil dinonaktifkan"}


@router.delete("/", status_code=status.HTTP_200_OK)
async def deactivate_all_patches(
    current_user: dict = Depends(get_current_developer)  # developer only
):
    """
    DELETE semua — nonaktifkan semua patch notif aktif sekaligus.
    Berguna untuk membersihkan notif lama.
    """
    count = crud_patch_notif.deactivate_all()
    logger.info(f"[PatchNotif] Semua ({count}) patch dinonaktifkan oleh {current_user.get('username')}")
    return {"message": f"Berhasil menonaktifkan {count} patch notification", "count": count}