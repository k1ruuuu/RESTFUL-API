from typing import Optional, Dict, Any, List
from crud.login_activity import crud_login_activity
from core.database import db  # <-- TAMBAHKAN IMPORT INI
from datetime import datetime, timedelta
from fastapi import Request

class LoginActivityService:
    """Service untuk mengelola aktivitas login"""
    
    @staticmethod
    def record_login(
        request: Request,
        user_id: int,
        username: str,
        status: str = "success",
        session_id: Optional[str] = None
    ) -> Optional[Dict[str, Any]]:
        """Record login attempt"""
        
        # Extract client information
        ip_address = request.client.host if request.client else None
        user_agent = request.headers.get("user-agent")
        
        # Create login record
        return crud_login_activity.create_login_record(
            user_id=user_id,
            username=username,
            ip_address=ip_address,
            user_agent=user_agent,
            status=status,
            session_id=session_id
        )
    
    @staticmethod
    def record_logout(session_id: str) -> bool:
        """Record user logout"""
        return crud_login_activity.update_logout(session_id)
    
    @staticmethod
    def get_active_sessions() -> List[Dict[str, Any]]:
        """Get all active sessions"""
        sessions = crud_login_activity.get_active_sessions()
        
        # Remove sensitive information
        for session in sessions:
            session.pop("user_agent", None)  # Keep but could truncate if needed
            
        return sessions
    
    @staticmethod
    def get_user_history(
        user_id: int, 
        days: int = 7,
        limit: int = 50
    ) -> List[Dict[str, Any]]:
        """Get login history for a user"""
        from_date = datetime.now() - timedelta(days=days)
        return crud_login_activity.get_user_login_history(
            user_id=user_id,
            from_date=from_date,
            limit=limit
        )
    
    @staticmethod
    def get_login_statistics() -> Dict[str, Any]:
        """Get login statistics"""
        return crud_login_activity.get_login_stats()
    
    @staticmethod
    def get_failed_login_attempts(
        username: Optional[str] = None,
        days: int = 1
    ) -> List[Dict[str, Any]]:
        """Get failed login attempts"""
        from_date = datetime.now() - timedelta(days=days)
        
        try:
            with db.get_cursor() as cursor:
                query = """
                    SELECT * FROM login_activity 
                    WHERE status = 'failed'
                    AND login_time >= %s
                """
                params = [from_date]
                
                if username:
                    query += " AND username = %s"
                    params.append(username)
                
                query += " ORDER BY login_time DESC"
                
                cursor.execute(query, params)
                return cursor.fetchall()
        except Exception as e:
            print(f"❌ Error getting failed attempts: {e}")
            return []
    
    @staticmethod
    def get_user_last_login(user_id: int) -> Optional[Dict[str, Any]]:
        """Get user's last login information"""
        history = crud_login_activity.get_user_login_history(user_id, limit=1)
        return history[0] if history else None
    
    @staticmethod
    def cleanup_old_logs(days: int = 90) -> int:
        """Clean up old login records"""
        return crud_login_activity.cleanup_old_records(days)

# Create singleton instance
login_activity_service = LoginActivityService()