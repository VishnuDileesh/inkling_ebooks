from sqlalchemy import Column, ForeignKey, Integer, Table

from app.db.base_class import Base

book_authors = Table(
    "books_book_authors",
    Base.metadata,
    Column("book_id", Integer, ForeignKey("books_book.id"), primary_key=True),
    Column("author_id", Integer, ForeignKey("books_author.id"), primary_key=True),
)

book_bookshelves = Table(
    "books_book_bookshelves",
    Base.metadata,
    Column("book_id", Integer, ForeignKey("books_book.id"), primary_key=True),
    Column("bookshelf_id", Integer, ForeignKey("books_bookshelf.id"), primary_key=True),
)

book_languages = Table(
    "books_book_languages",
    Base.metadata,
    Column("book_id", Integer, ForeignKey("books_book.id"), primary_key=True),
    Column("language_id", Integer, ForeignKey("books_language.id"), primary_key=True),
)

book_subjects = Table(
    "books_book_subjects",
    Base.metadata,
    Column("book_id", Integer, ForeignKey("books_book.id"), primary_key=True),
    Column("subject_id", Integer, ForeignKey("books_subject.id"), primary_key=True),
)
