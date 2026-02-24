from typing import Any
from crud.base import CRUDBase
from schemas.history_hydrantApar import (
    HistoryHydrantAparCreate,
    HistoryHydrantAparUpdate
)


class CRUDHistoryHydrantApar(
    CRUDBase[Any, HistoryHydrantAparCreate, HistoryHydrantAparUpdate]
):
    def __init__(self):
        super().__init__("history_hydrantapar")

    def get_by_no(self, no: str):
        return self.search_by_field("no", no)

    def get_last_history(self, no: str):
        return self.get_custom_query(
            """
            SELECT *
            FROM history_hydrantapar
            WHERE no = %s
            ORDER BY Tanggal_Pengecekan DESC
            LIMIT 1
            """,
            (no,)
        )


crud_history_hydrantApar = CRUDHistoryHydrantApar()