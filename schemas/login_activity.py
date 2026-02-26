from typing import Optional, Dict, Any, List
from crud.base import CRUDBase
from core.database import db  # <-- TAMBAHKAN IMPORT INI
import traceback
from datetime import datetime, timedelta

class CRUDLoginActivity(CRUDBase):
    def __init__(self):
        super().__init__("login_activity")
        print(f"✅ CRUDLoginActivity initialized for table: login_activity")
    
    def create_login_record(
        self, 
        user_id: int, 
        username: str, 
        ip_address: Optional[str] = None,
        user_agent: Optional[str] = None,
        status: str = "success",
        session_id: Optional[str] = None
    ) -> Optional[Dict[str, Any]]:
        """Create a new login activity record"""
        print(f"\n📝 Creating login record for user: {username}")
        
        try:
            login_data = {
                "user_id": user_id,
                "username": username,
                "ip_address": ip_address,
                "user_agent": user_agent,
                "status": status,
                "session_id": session_id,
                "login_time": datetime.now()
            }
            
            with db.get_cursor() as cursor:
                columns = ", ".join(login_data.keys())
                placeholders = ", ".join(["%s"] * len(login_data))
                
                query = f"INSERT INTO {self.table_name} ({columns}) VALUES ({placeholders})"
                cursor.execute(query, list(login_data.values()))
                
                last_id = cursor.lastrowid
                print(f"✅ Login record created with ID: {last_id}")
                return self.get(last_id)
                
        except Exception as e:
            print(f"❌ Error creating login record: {e}")
            traceback.print_exc()
            return None
    
    def update_logout(self, session_id: str) -> bool:
        """Update logout time when user logs out"""
        print(f"\n📝 Updating logout for session: {session_id}")
        
        try:
            with db.get_cursor() as cursor:
                query = f"""
                    UPDATE {self.table_name} 
                    SET logout_time = %s, status = 'logged_out', updated_at = %s
                    WHERE session_id = %s AND logout_time IS NULL
                """
                cursor.execute(query, (datetime.now(), datetime.now(), session_id))
                
                updated = cursor.rowcount > 0
                if updated:
                    print(f"✅ Logout recorded for session: {session_id}")
                else:
                    print(f"⚠️ No active session found for: {session_id}")
                
                return updated
                
        except Exception as e:
            print(f"❌ Error updating logout: {e}")
            traceback.print_exc()
            return False
    
    def get_active_sessions(self) -> List[Dict[str, Any]]:
        """Get all active sessions (logged in but not logged out)"""
        try:
            with db.get_cursor() as cursor:
                query = f"""
                    SELECT la.*, u.name as user_name, u.role as user_role
                    FROM {self.table_name} la
                    JOIN users u ON la.user_id = u.id
                    WHERE la.logout_time IS NULL 
                    AND la.status = 'success'
                    AND la.login_time > %s
                    ORDER BY la.login_time DESC
                """
                # Consider sessions active if login within last 24 hours
                cutoff_time = datetime.now() - timedelta(hours=24)
                cursor.execute(query, (cutoff_time,))
                return cursor.fetchall()
                
        except Exception as e:
            print(f"❌ Error getting active sessions: {e}")
            traceback.print_exc()
            return []
    
    def get_user_login_history(
        self, 
        user_id: int, 
        limit: int = 50,
        from_date: Optional[datetime] = None,
        to_date: Optional[datetime] = None
    ) -> List[Dict[str, Any]]:
        """Get login history for specific user"""
        try:
            with db.get_cursor() as cursor:
                query = f"""
                    SELECT * FROM {self.table_name}
                    WHERE user_id = %s
                """
                params = [user_id]
                
                if from_date:
                    query += " AND login_time >= %s"
                    params.append(from_date)
                
                if to_date:
                    query += " AND login_time <= %s"
                    params.append(to_date)
                
                query += " ORDER BY login_time DESC LIMIT %s"
                params.append(limit)
                
                cursor.execute(query, params)
                return cursor.fetchall()
                
        except Exception as e:
            print(f"❌ Error getting user login history: {e}")
            return []
    
    def get_login_stats(self) -> Dict[str, Any]:
        """Get login statistics"""
        try:
            stats = {}
            today = datetime.now().date()
            week_ago = datetime.now() - timedelta(days=7)
            month_ago = datetime.now() - timedelta(days=30)
            
            with db.get_cursor() as cursor:
                # Total logins
                cursor.execute(f"SELECT COUNT(*) as count FROM {self.table_name}")
                stats['total_logins'] = cursor.fetchone()['count']
                
                # Active sessions
                cursor.execute(f"""
                    SELECT COUNT(DISTINCT user_id) as count 
                    FROM {self.table_name} 
                    WHERE logout_time IS NULL 
                    AND login_time > %s
                """, (datetime.now() - timedelta(hours=24),))
                stats['active_sessions'] = cursor.fetchone()['count']
                
                # Failed attempts
                cursor.execute(f"""
                    SELECT COUNT(*) as count 
                    FROM {self.table_name} 
                    WHERE status = 'failed'
                """)
                stats['failed_attempts'] = cursor.fetchone()['count']
                
                # Unique users
                cursor.execute(f"SELECT COUNT(DISTINCT user_id) as count FROM {self.table_name}")
                stats['unique_users'] = cursor.fetchone()['count']
                
                # Today's logins
                cursor.execute(f"""
                    SELECT COUNT(*) as count 
                    FROM {self.table_name} 
                    WHERE DATE(login_time) = %s
                """, (today,))
                stats['logins_today'] = cursor.fetchone()['count']
                
                # This week's logins
                cursor.execute(f"""
                    SELECT COUNT(*) as count 
                    FROM {self.table_name} 
                    WHERE login_time >= %s
                """, (week_ago,))
                stats['logins_this_week'] = cursor.fetchone()['count']
                
                # This month's logins
                cursor.execute(f"""
                    SELECT COUNT(*) as count 
                    FROM {self.table_name} 
                    WHERE login_time >= %s
                """, (month_ago,))
                stats['logins_this_month'] = cursor.fetchone()['count']
                
            return stats
            
        except Exception as e:
            print(f"❌ Error getting login stats: {e}")
            return {
                'total_logins': 0,
                'active_sessions': 0,
                'failed_attempts': 0,
                'unique_users': 0,
                'logins_today': 0,
                'logins_this_week': 0,
                'logins_this_month': 0
            }
    
    def cleanup_old_records(self, days: int = 90) -> int:
        """Delete records older than specified days"""
        try:
            cutoff_date = datetime.now() - timedelta(days=days)
            with db.get_cursor() as cursor:
                query = f"DELETE FROM {self.table_name} WHERE login_time < %s"
                cursor.execute(query, (cutoff_date,))
                deleted = cursor.rowcount
                print(f"✅ Cleaned up {deleted} old login records")
                return deleted
                
        except Exception as e:
            print(f"❌ Error cleaning up old records: {e}")
            return 0

# Create singleton instance
crud_login_activity = CRUDLoginActivity()