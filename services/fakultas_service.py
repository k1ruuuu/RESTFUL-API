from typing import List, Dict, Any, Optional
from crud.fakultas import (
    crud_fk_ekonomi,
    crud_fk_syariah,
    crud_fk_dakwah,
    crud_fk_tarbiyah,
    crud_fk_hukum,
    crud_fk_psikologi,
    crud_fk_mipa,
    crud_fk_teknik,
    crud_fk_ik,
    crud_fk_kedokteran
)

class FakultasService:
    """Service untuk logika bisnis terkait fakultas"""
    
    @staticmethod
    def get_all_fakultas_summary() -> Dict[str, Any]:
        """Mendapatkan summary dari semua fakultas"""
        fakultas_list = [
            ("Ekonomi", crud_fk_ekonomi),
            ("Syariah", crud_fk_syariah),
            ("Dakwah", crud_fk_dakwah),
            ("Tarbiyah", crud_fk_tarbiyah),
            ("Hukum", crud_fk_hukum),
            ("Psikologi", crud_fk_psikologi),
            ("MIPA", crud_fk_mipa),
            ("Teknik", crud_fk_teknik),
            ("Ilmu Komputer", crud_fk_ik),
            ("Kedokteran", crud_fk_kedokteran)
        ]
        
        summary = {}
        total_ruangan = 0
        
        for nama, crud_instance in fakultas_list:
            try:
                data = crud_instance.get_multi(limit=1000)
                count = len(data)
                summary[nama] = {
                    "jumlah_ruangan": count,
                    "gedung_unik": len(set(item["gedung"] for item in data if item.get("gedung"))),
                    "lantai_tertinggi": max((item["lantai"] for item in data if item.get("lantai")), default=0)
                }
                total_ruangan += count
            except Exception as e:
                summary[nama] = {"error": str(e)}
        
        summary["total_semua_fakultas"] = total_ruangan
        return summary
    
    @staticmethod
    def search_across_fakultas(
        query: str,
        gedung: Optional[str] = None,
        lantai: Optional[int] = None
    ) -> List[Dict[str, Any]]:
        """Mencari data di semua fakultas"""
        all_results = []
        fakultas_cruds = [
            ("Ekonomi", crud_fk_ekonomi),
            ("Syariah", crud_fk_syariah),
            ("Dakwah", crud_fk_dakwah),
            ("Tarbiyah", crud_fk_tarbiyah),
            ("Hukum", crud_fk_hukum),
            ("Psikologi", crud_fk_psikologi),
            ("MIPA", crud_fk_mipa),
            ("Teknik", crud_fk_teknik),
            ("Ilmu Komputer", crud_fk_ik),
            ("Kedokteran", crud_fk_kedokteran)
        ]
        
        for fakultas_nama, crud_instance in fakultas_cruds:
            try:
                # Buat filter berdasarkan query
                filters = {}
                if gedung:
                    filters["gedung"] = gedung
                if lantai:
                    filters["lantai"] = lantai
                
                data = crud_instance.get_multi(filters=filters, limit=100)
                
                # Filter tambahan berdasarkan query string
                if query:
                    filtered_data = []
                    for item in data:
                        if (query.lower() in str(item.get("ruangan", "")).lower() or
                            query.lower() in str(item.get("subUnit", "")).lower() or
                            query.lower() in str(item.get("fk", "")).lower()):
                            item["fakultas"] = fakultas_nama
                            filtered_data.append(item)
                    all_results.extend(filtered_data)
                else:
                    for item in data:
                        item["fakultas"] = fakultas_nama
                    all_results.extend(data)
                    
            except Exception as e:
                # Log error dan lanjut ke fakultas berikutnya
                print(f"Error searching in {fakultas_nama}: {e}")
                continue
        
        # Sort by fakultas dan ruangan
        all_results.sort(key=lambda x: (x.get("fakultas", ""), x.get("ruangan", "")))
        return all_results
    
    @staticmethod
    def get_ruangan_by_gedung(gedung: str) -> Dict[str, List[Dict[str, Any]]]:
        """Mendapatkan semua ruangan di gedung tertentu"""
        result = {}
        fakultas_cruds = [
            ("Ekonomi", crud_fk_ekonomi),
            ("Syariah", crud_fk_syariah),
            ("Dakwah", crud_fk_dakwah),
            # ... tambahkan lainnya
        ]
        
        for fakultas_nama, crud_instance in fakultas_cruds:
            filters = {"gedung": gedung}
            data = crud_instance.get_multi(filters=filters)
            if data:
                for item in data:
                    item["fakultas"] = fakultas_nama
                result[fakultas_nama] = data
        
        return result
    
    @staticmethod
    def get_statistics() -> Dict[str, Any]:
        """Mendapatkan statistik keseluruhan"""
        stats = {
            "total_ruangan": 0,
            "gedung_count": set(),
            "lantai_distribution": {},
            "fakultas_distribution": {}
        }
        
        fakultas_cruds = [
            ("Ekonomi", crud_fk_ekonomi),
            ("Syariah", crud_fk_syariah),
            ("Dakwah", crud_fk_dakwah),
            ("Tarbiyah", crud_fk_tarbiyah),
            ("Hukum", crud_fk_hukum),
            ("Psikologi", crud_fk_psikologi),
            ("MIPA", crud_fk_mipa),
            ("Teknik", crud_fk_teknik),
            ("Ilmu Komputer", crud_fk_ik),
            ("Kedokteran", crud_fk_kedokteran)
        ]
        
        for fakultas_nama, crud_instance in fakultas_cruds:
            try:
                data = crud_instance.get_multi(limit=1000)
                count = len(data)
                stats["total_ruangan"] += count
                stats["fakultas_distribution"][fakultas_nama] = count
                
                for item in data:
                    # Collect unique buildings
                    if item.get("gedung"):
                        stats["gedung_count"].add(item["gedung"])
                    
                    # Count floors
                    lantai = item.get("lantai")
                    if lantai is not None:
                        stats["lantai_distribution"][lantai] = stats["lantai_distribution"].get(lantai, 0) + 1
                        
            except Exception as e:
                print(f"Error getting stats for {fakultas_nama}: {e}")
        
        stats["gedung_count"] = len(stats["gedung_count"])
        return stats

fakultas_service = FakultasService()