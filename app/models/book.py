from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship

from app.db.base_class import Base
from app.models.association_tables import (
    book_authors,
    book_bookshelves,
    book_languages,
    book_subjects,
)


class Book(Base):
    __tablename__ = "books_book"

    id = Column(Integer, primary_key=True, index=True)
    gutenberg_id = Column(Integer, unique=True, nullable=False, index=True)
    title = Column(String(1024), nullable=True)
    download_count = Column(Integer, nullable=True)
    media_type = Column(String(16), nullable=False)

    authors = relationship("Author", secondary=book_authors, back_populates="books")
    bookshelves = relationship(
        "Bookshelf", secondary=book_bookshelves, back_populates="books"
    )
    languages = relationship(
        "Language", secondary=book_languages, back_populates="books"
    )
    subjects = relationship("Subject", secondary=book_subjects, back_populates="books")
    formats = relationship("Format", back_populates="book")
