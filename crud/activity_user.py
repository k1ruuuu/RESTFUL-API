from typing import Optional, Dict, Any, List
from crud.base import CRUDBase
from core.database import db
import traceback
from datetime import datetime, timedelta

class CRUDActivity(CRUDBase):
    def __init__(self):
        super().__init__("activity_user")
        print(f"✅ CRUDActivity initialized for table: activity_user")
    
    def create_activity(
        self, 
        username: str, 
        aktivitas: str,
        waktu: Optional[datetime] = None
    ) -> Optional[Dict[str, Any]]:
        """Create a new activity record"""
        print(f"\n📝 Creating activity record for user: {username}")
        
        try:
            if waktu is None:
                waktu = datetime.now()
                
            activity_data = {
                "username": username,
                "aktivitas": aktivitas,
                "waktu": waktu
            }
            
            with db.get_cursor() as cursor:
                columns = ", ".join(activity_data.keys())
                placeholders = ", ".join(["%s"] * len(activity_data))
                
                query = f"INSERT INTO {self.table_name} ({columns}) VALUES ({placeholders})"
                cursor.execute(query, list(activity_data.values()))
                
                last_id = cursor.lastrowid
                print(f"✅ Activity record created with ID: {last_id}")
                return self.get(last_id)
                
        except Exception as e:
            print(f"❌ Error creating activity record: {e}")
            traceback.print_exc()
            return None
    
    def get_user_activities(
        self, 
        username: str, 
        limit: int = 50,
        offset: int = 0,
        from_date: Optional[datetime] = None,
        to_date: Optional[datetime] = None
    ) -> List[Dict[str, Any]]:
        """Get activity history for specific user"""
        try:
            with db.get_cursor() as cursor:
                query = f"""
                    SELECT * FROM {self.table_name}
                    WHERE username = %s
                """
                params = [username]
                
                if from_date:
                    query += " AND waktu >= %s"
                    params.append(from_date)
                
                if to_date:
                    query += " AND waktu <= %s"
                    params.append(to_date)
                
                query += " ORDER BY waktu DESC LIMIT %s OFFSET %s"
                params.append(limit)
                params.append(offset)
                
                cursor.execute(query, params)
                return cursor.fetchall()
                
        except Exception as e:
            print(f"❌ Error getting user activities: {e}")
            traceback.print_exc()
            return []
    
    def get_all_activities(
        self, 
        limit: int = 100,
        offset: int = 0,
        from_date: Optional[datetime] = None,
        to_date: Optional[datetime] = None
    ) -> List[Dict[str, Any]]:
        """Get all activities with optional filters"""
        try:
            with db.get_cursor() as cursor:
                query = f"SELECT * FROM {self.table_name}"
                params = []
                
                where_clauses = []
                if from_date:
                    where_clauses.append("waktu >= %s")
                    params.append(from_date)
                
                if to_date:
                    where_clauses.append("waktu <= %s")
                    params.append(to_date)
                
                if where_clauses:
                    query += " WHERE " + " AND ".join(where_clauses)
                
                query += " ORDER BY waktu DESC LIMIT %s OFFSET %s"
                params.append(limit)
                params.append(offset)
                
                cursor.execute(query, params)
                return cursor.fetchall()
                
        except Exception as e:
            print(f"❌ Error getting all activities: {e}")
            traceback.print_exc()
            return []
    
    def get_activity_stats(self) -> Dict[str, Any]:
        """Get activity statistics"""
        try:
            stats = {}
            today = datetime.now().date()
            week_ago = datetime.now() - timedelta(days=7)
            month_ago = datetime.now() - timedelta(days=30)
            
            with db.get_cursor() as cursor:
                # Total activities
                cursor.execute(f"SELECT COUNT(*) as count FROM {self.table_name}")
                stats['total_activities'] = cursor.fetchone()['count']
                
                # Unique users
                cursor.execute(f"SELECT COUNT(DISTINCT username) as count FROM {self.table_name}")
                stats['unique_users'] = cursor.fetchone()['count']
                
                # Today's activities
                cursor.execute(f"""
                    SELECT COUNT(*) as count 
                    FROM {self.table_name} 
                    WHERE DATE(waktu) = %s
                """, (today,))
                stats['activities_today'] = cursor.fetchone()['count']
                
                # This week's activities
                cursor.execute(f"""
                    SELECT COUNT(*) as count 
                    FROM {self.table_name} 
                    WHERE waktu >= %s
                """, (week_ago,))
                stats['activities_this_week'] = cursor.fetchone()['count']
                
                # This month's activities
                cursor.execute(f"""
                    SELECT COUNT(*) as count 
                    FROM {self.table_name} 
                    WHERE waktu >= %s
                """, (month_ago,))
                stats['activities_this_month'] = cursor.fetchone()['count']
                
                # Activity breakdown by type
                cursor.execute(f"""
                    SELECT aktivitas, COUNT(*) as count 
                    FROM {self.table_name} 
                    GROUP BY aktivitas 
                    ORDER BY count DESC
                """)
                stats['activity_breakdown'] = cursor.fetchall()
                
                # Most active users
                cursor.execute(f"""
                    SELECT username, COUNT(*) as count 
                    FROM {self.table_name} 
                    GROUP BY username 
                    ORDER BY count DESC 
                    LIMIT 10
                """)
                stats['most_active_users'] = cursor.fetchall()
                
            return stats
            
        except Exception as e:
            print(f"❌ Error getting activity stats: {e}")
            traceback.print_exc()
            return {
                'total_activities': 0,
                'unique_users': 0,
                'activities_today': 0,
                'activities_this_week': 0,
                'activities_this_month': 0,
                'activity_breakdown': [],
                'most_active_users': []
            }
    
    def delete_old_activities(self, days: int = 30) -> int:
        """Delete activities older than specified days"""
        try:
            cutoff_date = datetime.now() - timedelta(days=days)
            
            with db.get_cursor() as cursor:
                query = f"DELETE FROM {self.table_name} WHERE waktu < %s"
                cursor.execute(query, (cutoff_date,))
                deleted_count = cursor.rowcount
                
                print(f"✅ Deleted {deleted_count} old activities")
                return deleted_count
                
        except Exception as e:
            print(f"❌ Error deleting old activities: {e}")
            traceback.print_exc()
            return 0


# Create singleton instance
crud_user_activity = CRUDActivity()