# -*- encoding: utf-8 -*-
import sys

sys.path.append('..')

from flask import render_template, request, session, url_for
from jinja2 import TemplateNotFound
from connect_firebase import connect

from app import app

hosp_coll = connect('hospitals')
beds_coll = connect('beds')

@app.route('/', methods=['GET'])
def home():
    if request.method == 'GET':
        if session.get('email'):
            hosp_info = session.get('hosp_info')
            beds = session.get('beds')
            return render_template('index.html', hosp_info=hosp_info, beds=beds)
        else:
            return render_template('login.html')

@app.route('/login', methods=['POST', 'GET'])
def login():
    if request.method == 'POST':
        email = request.form.get('email')
        password = request.form.get('password')
        session['email'] = email
        # TODO: implement auth
        query_ref = hosp_coll.where(u'Email', u'==', u'{}'.format(email)).stream()
        hosp_info = next(query_ref).to_dict()
        beds = {}
        query_ref = beds_coll.where(u'Hospital', u'==', u'{}'.format(hosp_info.get('Hname'))).stream()
        for bed in query_ref:
            b = bed.to_dict()
            btype = b.pop('Bed_Type')
            beds[btype] = b
        session['hosp_info'] = hosp_info
        session['beds'] = beds
        return render_template('index.html', hosp_info=hosp_info, beds=beds)
    if request.method == 'GET':
        return render_template('login.html')

@app.route('/logout', methods=['POST', 'GET'])
def logout():
    if session.get('email'):
        session.pop('email')
        session.pop('hosp_info')
        session.pop('beds')
    return render_template('login.html')

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