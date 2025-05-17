from sqlalchemy import Column, Integer, String
from sqlalchemy.orm import relationship

from app.db.base_class import Base
from app.models.association_tables import book_subjects


class Subject(Base):
    __tablename__ = "books_subject"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(256), nullable=False)

    books = relationship("Book", secondary=book_subjects, back_populates="subjects")
