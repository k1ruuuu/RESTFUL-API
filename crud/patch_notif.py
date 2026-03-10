from typing import Optional, List
from core.database import db
import logging

logger = logging.getLogger(__name__)


class CRUDPatchNotif:
    """
    CRUD untuk tabel patch_notif.
    Logika: hanya boleh ada 1 patch aktif (is_active=1) pada satu waktu.
    Saat membuat patch baru, semua patch lama di-nonaktifkan terlebih dahulu.
    """

    def get_active(self) -> Optional[dict]:
        """GET patch notif aktif terbaru — untuk ditampilkan ke user"""
        try:
            with db.get_cursor() as cursor:
                cursor.execute(
                    "SELECT id, title, subtitle, message, bug_url, is_active, created_by, created_at, updated_at "
                    "FROM patch_notif "
                    "WHERE is_active = 1 "
                    "ORDER BY created_at DESC "
                    "LIMIT 1"
                )
                return cursor.fetchone()
        except Exception as e:
            logger.error(f"[CRUDPatchNotif.get_active] Error: {e}")
            return None

    def get_all(self, limit: int = 50, offset: int = 0) -> List[dict]:
        """GET semua patch notif (untuk admin/developer history)"""
        try:
            with db.get_cursor() as cursor:
                cursor.execute(
                    "SELECT id, title, subtitle, message, bug_url, is_active, created_by, created_at, updated_at "
                    "FROM patch_notif "
                    "ORDER BY created_at DESC "
                    "LIMIT %s OFFSET %s",
                    (limit, offset)
                )
                return cursor.fetchall() or []
        except Exception as e:
            logger.error(f"[CRUDPatchNotif.get_all] Error: {e}")
            return []

    def get_by_id(self, patch_id: int) -> Optional[dict]:
        """GET patch notif berdasarkan ID"""
        try:
            with db.get_cursor() as cursor:
                cursor.execute(
                    "SELECT id, title, subtitle, message, bug_url, is_active, created_by, created_at, updated_at "
                    "FROM patch_notif WHERE id = %s",
                    (patch_id,)
                )
                return cursor.fetchone()
        except Exception as e:
            logger.error(f"[CRUDPatchNotif.get_by_id] Error: {e}")
            return None

    def create(
        self,
        title: str,
        message: str,
        subtitle: Optional[str] = None,
        bug_url: Optional[str] = None,
        is_active: bool = True,
        created_by: Optional[str] = None,
    ) -> Optional[dict]:
        """
        POST buat patch notif baru.
        Jika is_active=True, nonaktifkan semua patch lama terlebih dahulu.
        """
        try:
            with db.get_cursor() as cursor:
                # Nonaktifkan semua patch aktif yang lama
                if is_active:
                    cursor.execute("UPDATE patch_notif SET is_active = 0 WHERE is_active = 1")

                # Insert patch baru
                cursor.execute(
                    "INSERT INTO patch_notif (title, subtitle, message, bug_url, is_active, created_by) "
                    "VALUES (%s, %s, %s, %s, %s, %s)",
                    (title, subtitle, message, bug_url, int(is_active), created_by)
                )
                new_id = cursor.lastrowid

            return self.get_by_id(new_id)

        except Exception as e:
            logger.error(f"[CRUDPatchNotif.create] Error: {e}")
            return None

    def deactivate(self, patch_id: int) -> bool:
        """Nonaktifkan patch notif berdasarkan ID (soft delete)"""
        try:
            with db.get_cursor() as cursor:
                cursor.execute(
                    "UPDATE patch_notif SET is_active = 0 WHERE id = %s",
                    (patch_id,)
                )
                return cursor.rowcount > 0
        except Exception as e:
            logger.error(f"[CRUDPatchNotif.deactivate] Error: {e}")
            return False

    def deactivate_all(self) -> int:
        """Nonaktifkan semua patch notif aktif. Return jumlah baris yang diupdate."""
        try:
            with db.get_cursor() as cursor:
                cursor.execute("UPDATE patch_notif SET is_active = 0 WHERE is_active = 1")
                return cursor.rowcount
        except Exception as e:
            logger.error(f"[CRUDPatchNotif.deactivate_all] Error: {e}")
            return 0


crud_patch_notif = CRUDPatchNotif()