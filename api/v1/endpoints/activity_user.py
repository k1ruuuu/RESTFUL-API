from typing import List, Optional
from fastapi import APIRouter, Depends, HTTPException, Query
from datetime import datetime, timedelta
from schemas.activity_user import ActivityInDB
from services.activity_user import activity_service
from api.deps import get_current_user
from api.v1.endpoints.auth import get_current_admin  # admin + developer
import logging

logger = logging.getLogger(__name__)

router = APIRouter()

@router.post("/activities", response_model=ActivityInDB)
async def create_activity(
    username: str,
    aktivitas: str,
    current_user = Depends(get_current_user)
):
    """Create a new activity record"""
    try:
        activity = await activity_service.create_activity(username=username, aktivitas=aktivitas)
        if not activity:
            raise HTTPException(status_code=400, detail="Failed to create activity")
        return activity
    except Exception as e:
        logger.error(f"Error in create_activity: {e}")
        raise HTTPException(status_code=500, detail=str(e))


@router.get("/activities/user/{username}", response_model=List[ActivityInDB])
async def get_user_activities(
    username: str,
    limit: int = Query(50, ge=1, le=1000),
    offset: int = Query(0, ge=0),
    from_date: Optional[datetime] = None,
    to_date: Optional[datetime] = None,
    current_user = Depends(get_current_admin)   # admin + developer
):
    """Get activities for a specific user (admin & developer)"""
    try:
        activities = await activity_service.get_user_activities(
            username=username, limit=limit, offset=offset,
            from_date=from_date, to_date=to_date
        )
        return activities
    except Exception as e:
        logger.error(f"Error in get_user_activities: {e}")
        raise HTTPException(status_code=500, detail=str(e))


@router.get("/activities", response_model=List[ActivityInDB])
async def get_all_activities(
    limit: int = Query(100, ge=1, le=1000),
    offset: int = Query(0, ge=0),
    from_date: Optional[datetime] = None,
    to_date: Optional[datetime] = None,
    current_user = Depends(get_current_admin)   # admin + developer
):
    """Get all activities with optional filters (admin & developer)"""
    try:
        activities = await activity_service.get_all_activities(
            limit=limit, offset=offset,
            from_date=from_date, to_date=to_date
        )
        return activities
    except Exception as e:
        logger.error(f"Error in get_all_activities: {e}")
        raise HTTPException(status_code=500, detail=str(e))


@router.get("/activities/stats")
async def get_activity_stats(
    current_user = Depends(get_current_admin)   # admin + developer
):
    """Get activity statistics (admin & developer)"""
    try:
        stats = await activity_service.get_activity_stats()
        return stats
    except Exception as e:
        logger.error(f"Error in get_activity_stats: {e}")
        raise HTTPException(status_code=500, detail=str(e))


@router.post("/activities/login/{username}")
async def log_login(
    username: str,
    current_user = Depends(get_current_user)
):
    """Log login activity"""
    try:
        activity = await activity_service.log_login(username)
        if not activity:
            raise HTTPException(status_code=400, detail="Failed to log login")
        return {"message": "Login logged successfully", "activity": activity}
    except Exception as e:
        logger.error(f"Error in log_login: {e}")
        raise HTTPException(status_code=500, detail=str(e))


@router.post("/activities/logout/{username}")
async def log_logout(
    username: str,
    current_user = Depends(get_current_user)
):
    """Log logout activity"""
    try:
        activity = await activity_service.log_logout(username)
        if not activity:
            raise HTTPException(status_code=400, detail="Failed to log logout")
        return {"message": "Logout logged successfully", "activity": activity}
    except Exception as e:
        logger.error(f"Error in log_logout: {e}")
        raise HTTPException(status_code=500, detail=str(e))


@router.post("/activities/create")
async def log_create(
    username: str,
    item_type: str,
    item_id: Optional[str] = None,
    current_user = Depends(get_current_user)
):
    """Log a create activity"""
    try:
        activity = await activity_service.log_create(username, item_type, item_id)
        if not activity:
            raise HTTPException(status_code=400, detail="Failed to log create activity")
        return {"message": "Create activity logged successfully", "activity": activity}
    except Exception as e:
        logger.error(f"Error in log_create: {e}")
        raise HTTPException(status_code=500, detail=str(e))


@router.post("/activities/update")
async def log_update(
    username: str,
    item_type: str,
    item_id: str,
    current_user = Depends(get_current_user)
):
    """Log an update activity"""
    try:
        activity = await activity_service.log_update(username, item_type, item_id)
        if not activity:
            raise HTTPException(status_code=400, detail="Failed to log update activity")
        return {"message": "Update activity logged successfully", "activity": activity}
    except Exception as e:
        logger.error(f"Error in log_update: {e}")
        raise HTTPException(status_code=500, detail=str(e))


@router.delete("/activities/old")
async def delete_old_activities(
    days: int = Query(30, ge=1, le=365),
    current_user = Depends(get_current_admin)   # admin + developer
):
    """Delete activities older than specified days (admin & developer)"""
    try:
        deleted_count = activity_service.delete_old_activities(days=days)
        return {
            "message": f"Deleted {deleted_count} activities older than {days} days",
            "deleted_count": deleted_count
        }
    except Exception as e:
        logger.error(f"Error in delete_old_activities: {e}")
        raise HTTPException(status_code=500, detail=str(e))