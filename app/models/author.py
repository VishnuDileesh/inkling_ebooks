from sqlalchemy import Column, Integer, SmallInteger, String
from sqlalchemy.orm import relationship

from app.db.base_class import Base
from app.models.association_tables import book_authors


class Author(Base):
    __tablename__ = "books_author"
    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(128), nullable=False)
    birth_year = Column(SmallInteger, nullable=True)
    death_year = Column(SmallInteger, nullable=True)

    books = relationship("Book", secondary=book_authors, back_populates="authors")
