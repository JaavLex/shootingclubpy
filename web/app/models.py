from datetime import datetime
from app import db

class Users(db.Model):
  __tablename__ = 'T_Personne'
  id_personne = db.Column(db.Integer, primary_key=True)
  date_de_naissance = db.Column(db.DateTime, nullable=True)
  prenom_pers = db.Column(db.String(25), nullable=False)
  nom_pers = db.Column(db.String(25), nullable=False)
  possession_arme = db.Column(db.String(1), nullable=False)


def __repr__(self):
  return '<User %r>' % self.prenom_pers
