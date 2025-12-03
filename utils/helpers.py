import re
from typing import Any, Dict, List, Optional
from datetime import datetime

class ValidationHelper:
    """Helper untuk validasi data"""
    
    @staticmethod
    def validate_email(email: str) -> bool:
        """Validasi format email"""
        pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$'
        return re.match(pattern, email) is not None
    
    @staticmethod
    def validate_phone(phone: str) -> bool:
        """Validasi format nomor telepon Indonesia"""
        pattern = r'^(\+62|62|0)8[1-9][0-9]{6,9}$'
        return re.match(pattern, phone) is not None
    
    @staticmethod
    def validate_ruangan_code(code: str) -> bool:
        """Validasi kode ruangan (contoh: A-101, B-201)"""
        pattern = r'^[A-Z]-[0-9]{3}$'
        return re.match(pattern, code) is not None

class DataFormatter:
    """Helper untuk format data"""
    
    @staticmethod
    def format_gedung_name(gedung: str) -> str:
        """Format nama gedung menjadi standar"""
        if not gedung:
            return gedung
        
        # Capitalize first letter of each word
        words = gedung.split()
        formatted = ' '.join(word.capitalize() for word in words)
        
        # Handle special cases
        if formatted.startswith('Gedung '):
            return formatted
        elif not formatted.startswith('Gedung'):
            return f'Gedung {formatted}'
        
        return formatted
    
    @staticmethod
    def format_date(date_string: str) -> Optional[str]:
        """Format date string ke format yang konsisten"""
        if not date_string:
            return None
        
        try:
            # Coba berbagai format
            formats = [
                '%Y-%m-%d %H:%M:%S',
                '%Y-%m-%d',
                '%d/%m/%Y %H:%M:%S',
                '%d/%m/%Y',
                '%d-%m-%Y %H:%M:%S',
                '%d-%m-%Y'
            ]
            
            for fmt in formats:
                try:
                    dt = datetime.strptime(date_string, fmt)
                    return dt.strftime('%Y-%m-%d %H:%M:%S')
                except ValueError:
                    continue
            
            return date_string
        except Exception:
            return date_string
    
    @staticmethod
    def sanitize_input(text: str) -> str:
        """Sanitize input untuk mencegah SQL injection dan XSS"""
        if not text:
            return text
        
        # Remove or escape potentially dangerous characters
        text = str(text)
        text = text.strip()
        
        # Replace potentially dangerous characters
        replacements = {
            "'": "''",
            '"': '\\"',
            ';': '',
            '--': '',
            '/*': '',
            '*/': '',
            '<': '&lt;',
            '>': '&gt;',
            '&': '&amp;'
        }
        
        for old, new in replacements.items():
            text = text.replace(old, new)
        
        return text

class ResponseHelper:
    """Helper untuk format response"""
    
    @staticmethod
    def success_response(
        data: Any = None,
        message: str = "Success",
        code: int = 200
    ) -> Dict[str, Any]:
        """Format response untuk success"""
        response = {
            "success": True,
            "message": message,
            "code": code,
            "timestamp": datetime.now().isoformat()
        }
        
        if data is not None:
            response["data"] = data
        
        return response
    
    @staticmethod
    def error_response(
        message: str = "Error",
        code: int = 400,
        details: Any = None
    ) -> Dict[str, Any]:
        """Format response untuk error"""
        response = {
            "success": False,
            "message": message,
            "code": code,
            "timestamp": datetime.now().isoformat()
        }
        
        if details is not None:
            response["details"] = details
        
        return response
    
    @staticmethod
    def paginated_response(
        items: List[Any],
        total: int,
        page: int,
        per_page: int,
        **kwargs
    ) -> Dict[str, Any]:
        """Format response dengan pagination"""
        total_pages = (total + per_page - 1) // per_page if per_page > 0 else 0
        
        response = {
            "items": items,
            "pagination": {
                "total": total,
                "page": page,
                "per_page": per_page,
                "total_pages": total_pages,
                "has_next": page < total_pages,
                "has_prev": page > 1
            }
        }
        
        response.update(kwargs)
        return ResponseHelper.success_response(response)

class FileHelper:
    """Helper untuk operasi file"""
    
    @staticmethod
    def get_file_extension(filename: str) -> str:
        """Dapatkan extension file"""
        return filename.split('.')[-1].lower() if '.' in filename else ''
    
    @staticmethod
    def is_valid_image_extension(extension: str) -> bool:
        """Cek apakah extension valid untuk gambar"""
        valid_extensions = ['jpg', 'jpeg', 'png', 'gif', 'bmp', 'webp']
        return extension in valid_extensions
    
    @staticmethod
    def generate_filename(original_filename: str, prefix: str = "") -> str:
        """Generate filename yang unik"""
        import uuid
        import os
        
        ext = FileHelper.get_file_extension(original_filename)
        unique_id = str(uuid.uuid4())[:8]
        timestamp = datetime.now().strftime("%Y%m%d_%H%M%S")
        
        if prefix:
            filename = f"{prefix}_{timestamp}_{unique_id}"
        else:
            filename = f"{timestamp}_{unique_id}"
        
        if ext:
            filename = f"{filename}.{ext}"
        
        return filename

# Singleton instances
validation = ValidationHelper()
formatter = DataFormatter()
response = ResponseHelper()
file_helper = FileHelper()