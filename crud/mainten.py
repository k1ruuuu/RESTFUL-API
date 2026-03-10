from typing import Optional
from core.database import db
import logging

logger = logging.getLogger(__name__)


class CRUDMainten:
    """
    CRUD untuk tabel mainten.
    Hanya ada 1 baris dengan id=1 (singleton pattern).
    """

    def get(self) -> Optional[dict]:
        """GET status maintenance (id=1)"""
        try:
            with db.get_cursor() as cursor:
                cursor.execute(
                    "SELECT id, status, message, updated_by, updated_at, created_at "
                    "FROM mainten WHERE id = 1"
                )
                row = cursor.fetchone()
                if row:
                    row["status"] = bool(row["status"])
                return row
        except Exception as e:
            logger.error(f"[CRUDMainten.get] Error: {e}")
            return None

    def update(self, status: Optional[bool], message: Optional[str], updated_by: Optional[str] = None) -> Optional[dict]:
        """
        PUT update maintenance (id=1).
        Hanya mengupdate field yang diberikan (tidak None).
        """
        try:
            fields = []
            params = []

            if status is not None:
                fields.append("status = %s")
                params.append(int(status))  # bool → TINYINT

            if message is not None:
                fields.append("message = %s")
                params.append(message)

            if updated_by is not None:
                fields.append("updated_by = %s")
                params.append(updated_by)

            if not fields:
                # Tidak ada yang diupdate, return data saat ini
                return self.get()

            params.append(1)  # WHERE id = 1
            sql = f"UPDATE mainten SET {', '.join(fields)} WHERE id = %s"

            with db.get_cursor() as cursor:
                cursor.execute(sql, params)

            return self.get()

        except Exception as e:
            logger.error(f"[CRUDMainten.update] Error: {e}")
            return None


crud_mainten = CRUDMainten()