from sqlalchemy import and_, func, or_, select
from sqlalchemy.orm import Session, selectinload

from app.models import Author, Book, Bookshelf, Format, Language, Subject


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

    query = db.query(Book).options(
        selectinload(Book.authors),
        selectinload(Book.languages),
        selectinload(Book.bookshelves),
        selectinload(Book.subjects),
        selectinload(Book.formats),
    )

    joined_tables = set()

    if gutenberg_ids:
        query = query.filter(Book.gutenberg_id.in_(gutenberg_ids))

    if languages:
        if "languages" not in joined_tables:
            query = query.join(Book.languages)
            joined_tables.add("languages")
        query = query.filter(Language.code.in_(languages))

    if mime_types:
        if "formats" not in joined_tables:
            query = query.join(Book.formats)
            joined_tables.add("formats")
        lower_mime_types = [mt.lower() for mt in mime_types]
        query = query.filter(func.lower(Format.mime_type).in_(lower_mime_types))

    if topics:
        topic_filters = []

        if "subjects" not in joined_tables:
            joined_tables.add("subjects")
        if "bookshelves" not in joined_tables:
            joined_tables.add("bookshelves")

        for topic in topics:
            subject_match_query = (
                select(Book.id.label("id"))
                .join(Book.subjects)
                .filter(Subject.name.ilike(f"%{topic}%"))
            )

            bookshelf_match_query = (
                select(Book.id.label("id"))
                .join(Book.bookshelves)
                .filter(Bookshelf.name.ilike(f"%{topic}%"))
            )

            topic_union_subquery = subject_match_query.union(
                bookshelf_match_query
            ).subquery()

            topic_filters.append(Book.id.in_(select(topic_union_subquery.c.id)))

        if topic_filters:
            query = query.filter(and_(*topic_filters))

    if authors:
        if "authors" not in joined_tables:
            query = query.join(Book.authors)
            joined_tables.add("authors")

        author_filters = [Author.name.ilike(f"%{a}%") for a in authors]
        query = query.filter(or_(*author_filters))

    if titles:
        title_filters = [Book.title.ilike(f"%{t}%") for t in titles]
        query = query.filter(or_(*title_filters))

    book_ids_subq = query.with_entities(Book.id.distinct()).subquery()
    total = db.query(func.count()).select_from(book_ids_subq).scalar()

    books = (
        query.distinct()
        .order_by(Book.download_count.desc())
        .offset((page - 1) * page_size)
        .limit(page_size)
        .all()
    )

    total_pages = (total + page_size - 1) // page_size

    return total, total_pages, books
