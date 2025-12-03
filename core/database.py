import mysql.connector
from mysql.connector import Error
from contextlib import contextmanager
from core.config import settings

class Database:
    def __init__(self):
        self.config = {
            "host": settings.DB_HOST,
            "user": settings.DB_USER,
            "password": settings.DB_PASSWORD,
            "database": settings.DB_NAME,
            "pool_name": "denah_pool",
            "pool_size": 5
        }
    
    @contextmanager
    def get_connection(self):
        """Context manager untuk mendapatkan koneksi database"""
        connection = None
        try:
            connection = mysql.connector.connect(**self.config)
            yield connection
        except Error as e:
            print(f"Error connecting to MySQL: {e}")
            raise
        finally:
            if connection and connection.is_connected():
                connection.close()
    
    @contextmanager
    def get_cursor(self, connection=None):
        """Context manager untuk mendapatkan cursor"""
        close_connection = False
        if not connection:
            connection = mysql.connector.connect(**self.config)
            close_connection = True
        
        cursor = None
        try:
            cursor = connection.cursor(dictionary=True)
            yield cursor
            connection.commit()
        except Error as e:
            connection.rollback()
            raise
        finally:
            if cursor:
                cursor.close()
            if close_connection and connection.is_connected():
                connection.close()

# Singleton instance
db = Database()