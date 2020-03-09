from flask import render_template
from app import app

@app.route('/default')
def default():
    return "Hello world!"

@app.route('/api')
def api():
    return {'hello': 'world'}

@app.route('/')
def index():
    return render_template('home.html', title='Hello World')
