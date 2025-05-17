from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship

from app.db.base_class import Base
from app.models.association_tables import book_languages


class Language(Base):
    __tablename__ = "books_language"

    id = Column(Integer, primary_key=True, index=True)
    code = Column(String(4), unique=True, nullable=False)

    books = relationship("Book", secondary=book_languages, back_populates="languages")
