# services/activity_service.py
from typing import Optional, List, Dict, Any
from datetime import datetime
from schemas.activity_user import ActivityCreate, ActivityInDB
from crud.activity_user import crud_user_activity
import logging

logger = logging.getLogger(__name__)

class ActivityService:
    """Service layer for activity management"""
    
    @staticmethod
    async def create_activity(
        username: str,
        aktivitas: str,
        waktu: Optional[datetime] = None
    ) -> Optional[ActivityInDB]:
        """
        Create a new activity record
        """
        try:
            if waktu is None:
                waktu = datetime.now()
                
            activity_data = ActivityCreate(
                username=username,
                aktivitas=aktivitas,
                waktu=waktu
            )
            
            # Create in database
            result = crud_user_activity.create_activity(
                username=activity_data.username,
                aktivitas=activity_data.aktivitas,
                waktu=activity_data.waktu
            )
            
            if result:
                logger.info(f"Activity created: {username} - {aktivitas}")
                return ActivityInDB.model_validate(result)
            return None
            
        except Exception as e:
            logger.error(f"Error creating activity: {e}")
            return None
    
    @staticmethod
    async def get_user_activities(
        username: str,
        limit: int = 50,
        offset: int = 0,
        from_date: Optional[datetime] = None,
        to_date: Optional[datetime] = None
    ) -> List[ActivityInDB]:
        """
        Get activities for a specific user
        """
        try:
            results = crud_user_activity.get_user_activities(
                username=username,
                limit=limit,
                offset=offset,
                from_date=from_date,
                to_date=to_date
            )
            
            return [ActivityInDB.model_validate(item) for item in results]
            
        except Exception as e:
            logger.error(f"Error getting user activities: {e}")
            return []
    
    @staticmethod
    async def get_all_activities(
        limit: int = 100,
        offset: int = 0,
        from_date: Optional[datetime] = None,
        to_date: Optional[datetime] = None
    ) -> List[ActivityInDB]:
        """
        Get all activities with filters
        """
        try:
            results = crud_user_activity.get_all_activities(
                limit=limit,
                offset=offset,
                from_date=from_date,
                to_date=to_date
            )
            
            return [ActivityInDB.model_validate(item) for item in results]
            
        except Exception as e:
            logger.error(f"Error getting all activities: {e}")
            return []
    
    @staticmethod
    async def get_activity_stats() -> Dict[str, Any]:
        """
        Get activity statistics
        """
        try:
            return crud_user_activity.get_activity_stats()
        except Exception as e:
            logger.error(f"Error getting activity stats: {e}")
            return {}
    
    @staticmethod
    async def log_login(username: str) -> Optional[ActivityInDB]:
        """
        Convenience method to log login activity
        """
        return await ActivityService.create_activity(
            username=username,
            aktivitas="login"
        )
    
    @staticmethod
    async def log_logout(username: str) -> Optional[ActivityInDB]:
        """
        Convenience method to log logout activity
        """
        return await ActivityService.create_activity(
            username=username,
            aktivitas="logout"
        )
    
    @staticmethod
    async def log_create(username: str, item_type: str, item_id: Optional[str] = None) -> Optional[ActivityInDB]:
        """
        Convenience method to log create activity
        """
        aktivitas = f"create {item_type}"
        if item_id:
            aktivitas += f" (ID: {item_id})"
            
        return await ActivityService.create_activity(
            username=username,
            aktivitas=aktivitas
        )
    
    @staticmethod
    async def log_update(username: str, item_type: str, item_id: str) -> Optional[ActivityInDB]:
        """
        Convenience method to log update activity
        """
        return await ActivityService.create_activity(
            username=username,
            aktivitas=f"update {item_type} (ID: {item_id})"
        )
    
    @staticmethod
    async def log_delete(username: str, item_type: str, item_id: str) -> Optional[ActivityInDB]:
        """
        Convenience method to log delete activity
        """
        return await ActivityService.create_activity(
            username=username,
            aktivitas=f"delete {item_type} (ID: {item_id})"
        )
    
    @staticmethod
    async def log_view(username: str, item_type: str, item_id: Optional[str] = None) -> Optional[ActivityInDB]:
        """
        Convenience method to log view activity
        """
        aktivitas = f"view {item_type}"
        if item_id:
            aktivitas += f" (ID: {item_id})"
            
        return await ActivityService.create_activity(
            username=username,
            aktivitas=aktivitas
        )


# Create singleton instance
activity_service = ActivityService()