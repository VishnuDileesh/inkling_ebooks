from fastapi import FastAPI
from slowapi import _rate_limit_exceeded_handler
from slowapi.errors import RateLimitExceeded

from app.api.v1.books import router as books_router
from app.limiter import limiter
from app.logger import setup_logging

setup_logging()


app = FastAPI(title="Inkling Ebooks", version="1.0.0")

app.state.limiter = limiter

app.add_exception_handler(RateLimitExceeded, _rate_limit_exceeded_handler)

app.include_router(books_router, prefix="/api/v1", tags=["Books"])


@app.get("/", tags=["Health Check"])
def read_root():
    return {"status": "ok", "message": "Inkling Ebooks API is up!"}
