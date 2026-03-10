from typing import Optional, List
from core.database import db
import logging

logger = logging.getLogger(__name__)


class CRUDCustomMessage:
    """
    CRUD untuk tabel custom_message.

    Query utama frontend:
      GET /custom_message/unread?username=X&role=Y
      → Ambil 1 pesan belum dibaca yang ditujukan ke username X
        ATAU ke role Y ATAU ke 'all'
    """

    def create(
        self,
        from_name: str,
        message: str,
        target_role: Optional[str] = None,
        target_username: Optional[str] = None,
    ) -> Optional[dict]:
        """POST kirim pesan baru"""
        try:
            with db.get_cursor() as cursor:
                cursor.execute(
                    "INSERT INTO custom_message (from_name, target_role, target_username, message) "
                    "VALUES (%s, %s, %s, %s)",
                    (from_name, target_role, target_username, message)
                )
                new_id = cursor.lastrowid
            return self.get_by_id(new_id)
        except Exception as e:
            logger.error(f"[CRUDCustomMessage.create] Error: {e}")
            return None

    def get_by_id(self, message_id: int) -> Optional[dict]:
        """GET pesan berdasarkan ID"""
        try:
            with db.get_cursor() as cursor:
                cursor.execute(
                    "SELECT id, from_name, target_role, target_username, message, "
                    "is_read, read_at, created_at "
                    "FROM custom_message WHERE id = %s",
                    (message_id,)
                )
                return cursor.fetchone()
        except Exception as e:
            logger.error(f"[CRUDCustomMessage.get_by_id] Error: {e}")
            return None

    def get_unread_for_user(self, username: str, role: str) -> Optional[dict]:
        """
        GET 1 pesan belum dibaca untuk user tertentu.
        Matching logic:
          - target_username = username (pesan langsung ke user ini)
          - OR target_role   = role    (pesan ke semua user dengan role ini)
          - OR target_role   = 'all'   (pesan ke semua user)
        Diurutkan terbaru di atas, ambil 1 saja.
        """
        try:
            with db.get_cursor() as cursor:
                cursor.execute(
                    """
                    SELECT id, from_name, target_role, target_username,
                           message, is_read, read_at, created_at
                    FROM custom_message
                    WHERE is_read = 0
                      AND (
                        target_username = %s
                        OR target_role  = %s
                        OR target_role  = 'all'
                      )
                    ORDER BY created_at DESC
                    LIMIT 1
                    """,
                    (username, role)
                )
                return cursor.fetchone()
        except Exception as e:
            logger.error(f"[CRUDCustomMessage.get_unread_for_user] Error: {e}")
            return None

    def get_all(
        self,
        limit: int = 100,
        offset: int = 0,
        unread_only: bool = False,
    ) -> List[dict]:
        """GET semua pesan (untuk developer history)"""
        try:
            where = "WHERE is_read = 0" if unread_only else ""
            with db.get_cursor() as cursor:
                cursor.execute(
                    f"SELECT id, from_name, target_role, target_username, message, "
                    f"is_read, read_at, created_at "
                    f"FROM custom_message "
                    f"{where} "
                    f"ORDER BY created_at DESC "
                    f"LIMIT %s OFFSET %s",
                    (limit, offset)
                )
                return cursor.fetchall() or []
        except Exception as e:
            logger.error(f"[CRUDCustomMessage.get_all] Error: {e}")
            return []

    def mark_read(self, message_id: int) -> bool:
        """PATCH tandai pesan sudah dibaca"""
        try:
            with db.get_cursor() as cursor:
                cursor.execute(
                    "UPDATE custom_message SET is_read = 1, read_at = NOW() WHERE id = %s AND is_read = 0",
                    (message_id,)
                )
                return cursor.rowcount > 0
        except Exception as e:
            logger.error(f"[CRUDCustomMessage.mark_read] Error: {e}")
            return False

    def mark_read_all_for_user(self, username: str, role: str) -> int:
        """Tandai semua pesan belum dibaca untuk user ini sebagai sudah dibaca"""
        try:
            with db.get_cursor() as cursor:
                cursor.execute(
                    """
                    UPDATE custom_message
                    SET is_read = 1, read_at = NOW()
                    WHERE is_read = 0
                      AND (
                        target_username = %s
                        OR target_role  = %s
                        OR target_role  = 'all'
                      )
                    """,
                    (username, role)
                )
                return cursor.rowcount
        except Exception as e:
            logger.error(f"[CRUDCustomMessage.mark_read_all_for_user] Error: {e}")
            return 0


crud_custom_message = CRUDCustomMessage()