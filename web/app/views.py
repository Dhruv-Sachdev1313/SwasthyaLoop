# -*- encoding: utf-8 -*-
import sys

sys.path.append('..')

from flask import render_template, request
from jinja2 import TemplateNotFound
from connect_firebase import connect

from app import app

hosp_coll = connect('hospitals')
beds_coll = connect('beds')

@app.route('/', methods=['POST', 'GET']) #defaults={'path': 'login.html'}
def home():
    if request.method == 'GET':
        return render_template('login.html')
    if request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password')
        query_ref = hosp_coll.where(u'Email ID', u'==', u'info@lilavatihospital.com')
        print(query_ref)
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
