from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship

from app.db.base_class import Base
from app.models.association_tables import book_bookshelves


class Bookshelf(Base):
    __tablename__ = "books_bookshelf"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(64), unique=True, nullable=False)

    books = relationship(
        "Book", secondary=book_bookshelves, back_populates="bookshelves"
    )
