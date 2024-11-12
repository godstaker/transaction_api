from sqlalchemy import Column, Float, String, DateTime
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

class Transaction(Base):
    __tablename__ = 'transactions'
    
    transaction_id = Column(String, primary_key=True, index=True)
    amount = Column(Float, nullable=False)
    timestamp = Column(DateTime, nullable=False)
