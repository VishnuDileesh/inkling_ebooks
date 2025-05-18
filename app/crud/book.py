import logging

from fastapi import HTTPException
from sqlalchemy import and_, func, or_, select

# from sqlalchemy.dialects import postgresql
from sqlalchemy.exc import SQLAlchemyError
from sqlalchemy.orm import Session, selectinload

from app.models import Author, Book, Bookshelf, Format, Language, Subject

# import time


logger = logging.getLogger(__name__)


def apply_gutenberg_filter(query, ids):
    if ids:
        query = query.filter(Book.gutenberg_id.in_(ids))
    return query


def apply_language_filter(query, languages):
    if languages:
        query = query.join(Book.languages).filter(Language.code.in_(languages))
    return query


def apply_mime_filter(query, mime_types):
    if mime_types:
        lower_mimes = [mt.lower() for mt in mime_types]
        query = query.join(Book.formats).filter(
            func.lower(Format.mime_type).in_(lower_mimes)
        )
    return query


def apply_author_filter(query, authors):
    if authors:
        query = query.join(Book.authors).filter(
            or_(*[Author.name.ilike(f"%{a}%") for a in authors])
        )
    return query


def apply_title_filter(query, titles):
    if titles:
        query = query.filter(or_(*[Book.title.ilike(f"%{t}%") for t in titles]))
    return query


def apply_topic_filter(query, db, topics):
    if topics:
        subject_subq = (
            db.query(Book.id)
            .join(Book.subjects)
            .filter(or_(*[Subject.name.ilike(f"%{t}%") for t in topics]))
            .distinct()
            .subquery()
        )

        bookshelf_subq = (
            db.query(Book.id)
            .join(Book.bookshelves)
            .filter(or_(*[Bookshelf.name.ilike(f"%{t}%") for t in topics]))
            .distinct()
            .subquery()
        )

        query = query.filter(
            or_(Book.id.in_(subject_subq), Book.id.in_(bookshelf_subq))
        )
    return query


def get_books_filtered(
    db: Session,
    gutenberg_ids: list[int] = None,
    languages: list[str] = None,
    mime_types: list[str] = None,
    topics: list[str] = None,
    authors: list[str] = None,
    titles: list[str] = None,
    page: int = 1,
    page_size: int = 25,
):

    gutenberg_ids = gutenberg_ids or []
    languages = languages or []
    mime_types = mime_types or []
    topics = topics or []
    authors = authors or []
    titles = titles or []

    try:

        # start = time.time()

        query = db.query(Book)

        query = apply_gutenberg_filter(query, gutenberg_ids)
        query = apply_language_filter(query, languages)
        query = apply_mime_filter(query, mime_types)
        query = apply_topic_filter(query, db, topics)
        query = apply_author_filter(query, authors)
        query = apply_title_filter(query, titles)

        book_ids_subq = query.with_entities(Book.id.distinct()).subquery()
        total = db.query(func.count()).select_from(book_ids_subq).scalar()

        books = (
            query.distinct()
            .order_by(Book.download_count.desc())
            .offset((page - 1) * page_size)
            .limit(page_size)
            .options(
                selectinload(Book.authors),
                selectinload(Book.languages),
                selectinload(Book.bookshelves),
                selectinload(Book.subjects),
                selectinload(Book.formats),
            )
            .all()
        )

        # print(
        #     query.statement.compile(
        #         dialect=postgresql.dialect(), compile_kwargs={"literal_binds": True}
        #     )
        # )

        total_pages = (total + page_size - 1) // page_size

        # logger.info(f"Books query took {round((time.time() - start)*1000, 2)} ms")

        return total, total_pages, books

    except SQLAlchemyError:
        logger.exception("Database error while filtering books")
        raise HTTPException(status_code=500, detail="Internal database error.")
    except Exception:
        logger.exception("Unexpected error in get_books_filtered")
        raise HTTPException(status_code=500, detail="An unexpected error occurred.")
