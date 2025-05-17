from typing import List, Optional

from fastapi import APIRouter, Depends, Query
from sqlalchemy.orm import Session

from app.crud.book import get_books_filtered
from app.db.deps import get_db
from app.schemas import Book as BookSchema

router = APIRouter()


@router.get("/books")
def get_books(
    gutenberg_ids: Optional[List[int]] = Query(None),
    languages: Optional[List[str]] = Query(None),
    mime_types: Optional[List[str]] = Query(None),
    topics: Optional[List[str]] = Query(None),
    authors: Optional[List[str]] = Query(None),
    titles: Optional[List[str]] = Query(None),
    page: int = Query(1, ge=1),
    db: Session = Depends(get_db),
):

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
