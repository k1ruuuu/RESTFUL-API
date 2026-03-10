from fastapi import APIRouter, Depends, HTTPException, Query, status
from typing import List, Optional
from schemas.custom_message import (
    CustomMessageCreate, CustomMessageInDB,
    CustomMessageUnreadResponse, CustomMessageMarkRead
)
from crud.custom_message import crud_custom_message
from api.v1.endpoints.auth import get_current_user, get_current_developer, get_current_admin
import logging

logger = logging.getLogger(__name__)

router = APIRouter(prefix="/custom_message", tags=["custom message"])


@router.get("/unread", response_model=Optional[CustomMessageUnreadResponse])
async def get_unread_message(
    username: str = Query(..., description="Username user yang sedang login"),
    role: str = Query(..., description="Role user yang sedang login: admin / user / developer"),
    current_user: dict = Depends(get_current_user)   # semua user yang sudah login
):
    """
    GET 1 pesan belum dibaca untuk user ini.
    Diakses semua user — frontend polling tiap 60 detik.

    Matching logic:
    - target_username = username (pesan langsung)
    - OR target_role = role (pesan ke semua user dengan role ini)
    - OR target_role = 'all' (pesan ke semua user)

    Return null jika tidak ada pesan baru.
    """
    # Validasi: user hanya boleh cek pesan miliknya sendiri
    if current_user.get("username") != username and current_user.get("role") not in ["admin", "developer"]:
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN,
            detail="Anda hanya bisa mengecek pesan milik Anda sendiri"
        )

    data = crud_custom_message.get_unread_for_user(username=username, role=role)
    if not data:
        return None
    return data


@router.post("/", response_model=CustomMessageInDB, status_code=status.HTTP_201_CREATED)
async def send_custom_message(
    payload: CustomMessageCreate,
    current_user: dict = Depends(get_current_developer)  # developer only
):
    """
    POST kirim pesan kustom.
    Hanya developer yang bisa mengirim pesan.

    Target bisa berupa:
    - target_role = 'all'   → semua user
    - target_role = 'admin' → semua admin
    - target_role = 'user'  → semua user biasa
    - target_username = 'x' → user tertentu
    """
    new_msg = crud_custom_message.create(
        from_name=payload.from_name or current_user.get("username"),
        message=payload.message,
        target_role=payload.target_role,
        target_username=payload.target_username,
    )
    if not new_msg:
        raise HTTPException(
            status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
            detail="Gagal mengirim pesan"
        )

    target_info = (
        f"role={payload.target_role}" if payload.target_role
        else f"username={payload.target_username}"
    )
    logger.info(f"[CustomMessage] Dikirim oleh {current_user.get('username')} ke {target_info}")
    return new_msg


@router.patch("/{message_id}/read", status_code=status.HTTP_200_OK)
async def mark_message_read(
    message_id: int,
    current_user: dict = Depends(get_current_user)   # semua user
):
    """
    PATCH tandai pesan sudah dibaca.
    Frontend memanggil ini setelah user menutup dialog pesan.
    """
    success = crud_custom_message.mark_read(message_id)
    if not success:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="Pesan tidak ditemukan atau sudah ditandai dibaca"
        )
    return {"message": "Pesan berhasil ditandai sudah dibaca", "message_id": message_id}


@router.patch("/read-all", status_code=status.HTTP_200_OK)
async def mark_all_read(
    current_user: dict = Depends(get_current_user)   # semua user
):
    """
    PATCH tandai semua pesan belum dibaca milik user ini sebagai sudah dibaca.
    Berguna saat user membuka halaman notifikasi.
    """
    count = crud_custom_message.mark_read_all_for_user(
        username=current_user.get("username"),
        role=current_user.get("role"),
    )
    return {
        "message": f"Berhasil menandai {count} pesan sebagai sudah dibaca",
        "count": count
    }


@router.get("/", response_model=List[CustomMessageInDB])
async def get_all_messages(
    limit: int = Query(100, ge=1, le=500),
    offset: int = Query(0, ge=0),
    unread_only: bool = Query(False, description="True = hanya pesan belum dibaca"),
    current_user: dict = Depends(get_current_admin)  # admin + developer
):
    """
    GET semua pesan kustom (riwayat).
    Hanya untuk admin & developer.
    """
    return crud_custom_message.get_all(limit=limit, offset=offset, unread_only=unread_only)