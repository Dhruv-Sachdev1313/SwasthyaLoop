# -*- encoding: utf-8 -*-
# Flask modules
from flask import render_template, request
from jinja2 import TemplateNotFound

# App modules
from app import app

# App main route + generic routing
@app.route('/', methods=['POST', 'GET']) #defaults={'path': 'login.html'}
def home():
    if request.method == 'GET':
        return render_template('login.html')
    if request.method == 'POST':
        return render_template('index.html')

@app.route('/<path>')
def index(path):
    try:
        segment = get_segment( request )
        return render_template( path, segment=segment )
    except TemplateNotFound:
        return render_template('page-404.html'), 404

def get_segment(request): 
    try:
        segment = request.path.split('/')[-1]
        if segment == '':
            segment = 'index'
        return segment
    except:
        return None   
