from fastapi import Request
from starlette.middleware.base import BaseHTTPMiddleware
from services.login_activity_service import login_activity_service
import time

class LoginActivityMiddleware(BaseHTTPMiddleware):
    async def dispatch(self, request: Request, call_next):
        # Skip untuk non-API routes
        if not request.url.path.startswith("/api/"):
            return await call_next(request)
        
        # Process request
        start_time = time.time()
        response = await call_next(request)
        process_time = time.time() - start_time
        
        # Log API access (opsional)
        response.headers["X-Process-Time"] = str(process_time)
        
        return response