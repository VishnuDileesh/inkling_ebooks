import logging
from typing import List, Optional

from fastapi import APIRouter, Depends, HTTPException, Query, Request
from slowapi.util import get_remote_address
from sqlalchemy.orm import Session

from app.crud.book import get_books_filtered
from app.db.deps import get_db
from app.limiter import limiter
from app.schemas import Book as BookSchema

logger = logging.getLogger(__name__)


router = APIRouter()


@router.get("/books")
@limiter.limit("10/minute")
def get_books(
    request: Request,
    gutenberg_ids: Optional[List[int]] = Query(None),
    languages: Optional[List[str]] = Query(None),
    mime_types: Optional[List[str]] = Query(None),
    topics: Optional[List[str]] = Query(None),
    authors: Optional[List[str]] = Query(None),
    titles: Optional[List[str]] = Query(None),
    page: int = Query(1, ge=1),
    db: Session = Depends(get_db),
):

    try:
        total, total_pages, books = get_books_filtered(
            db=db,
            gutenberg_ids=gutenberg_ids or [],
            languages=languages or [],
            mime_types=mime_types or [],
            topics=topics or [],
            authors=authors or [],
            titles=titles or [],
            page=page,
        )

        return {
            "total_books": total,
            "page": page,
            "total_pages": total_pages,
            "books": [BookSchema.model_validate(book) for book in books],
        }

    except Exception as e:
        logger.exception("Error occurred while fetching books.")
        raise HTTPException(
            status_code=500, detail="An error occurred while processing your request."
        )
