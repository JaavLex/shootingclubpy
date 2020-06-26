from flask import render_template
from app import app
from app.models import Users

@app.route('/default')
def default():
  return "Hello world!"

@app.route('/api')
def api():
  return {'hello': 'world'}

@app.route('/', methods=["GET", "POST"])
def index():
  return render_template('home.html', title='Hello World')

@app.route('/user')
def user():
  users = Users.query.order_by(Users.nom_pers.asc()).all()
  return render_template('users.html', title='User', users=users)
  #return '<pre>'+' '.join([str(elem) for elem in users])
