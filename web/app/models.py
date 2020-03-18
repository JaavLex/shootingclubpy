from datetime import datetime
from app import db

class Users(db.Model):
  user = db.Column(db.Integer, primary_key=True)
  birth_date = db.Column(db.DateTime, nullable=True)
  first_name = db.Column(db.String(25), nullable=False)
  last_name = db.Column(db.String(25), nullable=False)
  username = db.Column(db.String(16), unique=True, nullable=False)
  email = db.Column(db.String(255), unique=True, nullable=False)
  gender = db.Column(db.String(1), nullable=False)

def __repr__(self):
  return '<User %r>' % self.username
