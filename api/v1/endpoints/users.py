# api/v1/endpoints/users.py
from fastapi import APIRouter, Depends, HTTPException, Query, status
from typing import List, Optional
from schemas.user import UserInDB, UserCreate, UserUpdate
from crud.user import crud_user
from services.user_service import user_service
from services.activity_service import activity_service
from api.v1.endpoints.auth import get_current_admin, get_current_developer, get_current_user
import logging

logging.basicConfig(level=logging.DEBUG)
logger = logging.getLogger(__name__)


router = APIRouter(prefix="/users", tags=["users"])

# ============================================================
# Helper guards
# ============================================================

def _guard_admin_vs_developer(current_user: dict, target_user: dict):
    """Admin tidak boleh CRUD akun developer. Developer bisa semua."""
    if (
        current_user.get("role") == "admin"
        and target_user.get("role") == "developer"
    ):
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN,
            detail="Admin tidak dapat mengubah atau menghapus akun Developer"
        )

def _guard_admin_set_developer_role(current_user: dict, role: Optional[str]):
    """Admin tidak boleh set/upgrade role menjadi developer."""
    if current_user.get("role") == "admin" and role == "developer":
        raise HTTPException(
            status_code=status.HTTP_403_FORBIDDEN,
            detail="Admin tidak dapat membuat atau mengubah role menjadi Developer"
        )


# ============================================================
# Public endpoints (user yang sudah login)
# ============================================================

@router.get("/me", response_model=UserInDB)
async def get_current_user_info(
    current_user: dict = Depends(get_current_user)
):
    """Get current user profile"""
    await activity_service.log_view(
        username=current_user["username"],
        item_type="profile",
        item_id=str(current_user["id"])
    )
    return user_service.get_user_profile(current_user["id"])


@router.put("/me", response_model=UserInDB)
async def update_current_user(
    user_in: UserUpdate,
    current_user: dict = Depends(get_current_user)
):
    """Update current user profile"""
    try:
        update_data = {}
        if user_in.name is not None:
            update_data["name"] = user_in.name
        if user_in.password is not None:
            update_data["password"] = user_in.password

        updated_user = user_service.update_user(current_user["id"], update_data)
        if not updated_user:
            raise HTTPException(status_code=404, detail="User not found")

        await activity_service.log_update(
            username=current_user["username"],
            item_type="profile",
            item_id=str(current_user["id"])
        )
        return updated_user
    except ValueError as e:
        raise HTTPException(status_code=400, detail=str(e))


@router.post("/me/change-password")
async def change_my_password(
    old_password: str,
    new_password: str,
    current_user: dict = Depends(get_current_user)
):
    """Change current user password"""
    success = user_service.change_password(current_user["id"], old_password, new_password)
    if not success:
        raise HTTPException(status_code=400, detail="Old password is incorrect or user not found")
    await activity_service.create_activity(
        username=current_user["username"],
        aktivitas="change_password"
    )
    return {"message": "Password changed successfully"}


# ============================================================
# Admin + Developer endpoints
# ============================================================

@router.get("/", response_model=List[UserInDB])
async def get_all_users(
    current_user: dict = Depends(get_current_admin),  # admin + developer
    skip: int = Query(0, ge=0),
    limit: int = Query(100, ge=1, le=1000),
    include_stats: bool = Query(False)
):
    """Mendapatkan semua user (admin & developer)"""
    await activity_service.log_view(
        username=current_user["username"],
        item_type="user_list"
    )
    if include_stats:
        result = user_service.get_users_with_stats(skip=skip, limit=limit)
        return result["users"]
    else:
        users = crud_user.get_multi(skip=skip, limit=limit)
        for user in users:
            user.pop("password", None)
        return users


@router.get("/stats")
async def get_user_statistics(
    current_user: dict = Depends(get_current_admin)   # admin + developer
):
    """Get user statistics (admin & developer)"""
    await activity_service.log_view(
        username=current_user["username"],
        item_type="user_statistics"
    )
    result = user_service.get_users_with_stats()
    return {"stats": result["stats"], "total_users": result["stats"]["total"]}


@router.get("/{user_id}", response_model=UserInDB)
async def get_user(
    user_id: int,
    current_user: dict = Depends(get_current_admin)   # admin + developer
):
    """Mendapatkan user berdasarkan ID (admin & developer)"""
    user = crud_user.get(user_id)
    if not user:
        raise HTTPException(status_code=404, detail="User not found")
    await activity_service.log_view(
        username=current_user["username"],
        item_type="user_detail",
        item_id=str(user_id)
    )
    user.pop("password", None)
    return user


@router.post("/", response_model=UserInDB, status_code=status.HTTP_201_CREATED)
async def create_user(
    user_in: UserCreate,
    current_user: dict = Depends(get_current_admin)   # admin + developer
):
    """Buat user baru.
    Admin TIDAK bisa membuat akun dengan role developer."""
    logger.debug("=" * 50)
    logger.debug(f"CREATE USER | by: {current_user.get('username')} ({current_user.get('role')})")
    logger.debug(f"Payload: {user_in.dict()}")
    logger.debug("=" * 50)

    # Guard: admin tidak bisa buat akun developer
    _guard_admin_set_developer_role(current_user, user_in.dict().get("role"))

    try:
        new_user = user_service.create_user(user_in.dict())
        await activity_service.log_create(
            username=current_user["username"],
            item_type="user",
            item_id=str(new_user["id"])
        )
        return new_user
    except ValueError as e:
        logger.error(f"ValueError: {str(e)}")
        raise HTTPException(status_code=400, detail=str(e))
    except Exception as e:
        logger.error(f"Unexpected error: {str(e)}", exc_info=True)
        raise HTTPException(status_code=500, detail=f"Internal server error: {str(e)}")


@router.put("/{user_id}", response_model=UserInDB)
async def update_user(
    user_id: int,
    user_in: UserUpdate,
    current_user: dict = Depends(get_current_admin)   # admin + developer
):
    """Update user.
    Admin TIDAK bisa mengubah akun developer atau upgrade role ke developer."""
    user = crud_user.get(user_id)
    if not user:
        raise HTTPException(status_code=404, detail="User not found")

    _guard_admin_vs_developer(current_user, user)
    _guard_admin_set_developer_role(current_user, user_in.dict().get("role"))

    try:
        update_data = {k: v for k, v in user_in.dict().items() if v is not None}
        updated_user = user_service.update_user(user_id, update_data)
        if not updated_user:
            raise HTTPException(status_code=400, detail="Update failed")
        await activity_service.log_update(
            username=current_user["username"],
            item_type="user",
            item_id=str(user_id)
        )
        return updated_user
    except ValueError as e:
        raise HTTPException(status_code=400, detail=str(e))


@router.delete("/{user_id}")
async def delete_user(
    user_id: int,
    current_user: dict = Depends(get_current_admin)   # admin + developer
):
    """Hapus user.
    Admin TIDAK bisa menghapus akun developer."""
    user = crud_user.get(user_id)
    if not user:
        raise HTTPException(status_code=404, detail="User not found")

    if user_id == current_user["id"]:
        raise HTTPException(status_code=400, detail="Cannot delete your own account")

    _guard_admin_vs_developer(current_user, user)

    deleted_username = user.get("username")
    success = user_service.delete_user(user_id)
    if not success:
        raise HTTPException(status_code=400, detail="Delete failed")

    await activity_service.log_delete(
        username=current_user["username"],
        item_type="user",
        item_id=str(user_id)
    )
    await activity_service.create_activity(
        username=current_user["username"],
        aktivitas=f"deleted_user_{deleted_username}_id_{user_id}"
    )
    return {"message": f"User {deleted_username} deleted successfully"}


@router.post("/{user_id}/reset-password")
async def reset_user_password(
    user_id: int,
    new_password: str,
    current_user: dict = Depends(get_current_admin)   # admin + developer
):
    """Reset password user.
    Admin TIDAK bisa reset password akun developer."""
    user = crud_user.get(user_id)
    if not user:
        raise HTTPException(status_code=404, detail="User not found")

    _guard_admin_vs_developer(current_user, user)

    from core.security import get_password_hash
    hashed_password = get_password_hash(new_password)
    updated = crud_user.update(user_id, {"password": hashed_password})
    if not updated:
        raise HTTPException(status_code=400, detail="Failed to reset password")

    await activity_service.create_activity(
        username=current_user["username"],
        aktivitas=f"reset_password_for_user_{user.get('username')}_id_{user_id}"
    )
    return {"message": f"Password for user {user.get('username')} reset successfully"}