from sqlalchemy import Column, ForeignKey, Integer, String
from sqlalchemy.orm import relationship

from app.db.base_class import Base


class Format(Base):
    __tablename__ = "books_format"

    id = Column(Integer, primary_key=True, index=True)
    mime_type = Column(String(32), nullable=False)
    url = Column(String(256), nullable=False)
    book_id = Column(Integer, ForeignKey("books_book.id"), nullable=False)

    book = relationship("Book", back_populates="formats")
