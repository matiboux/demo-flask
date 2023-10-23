#!/usr/bin/env python3

import flask

app = flask.Flask(__name__)

@app.route('/')
def index():
	return 'Bem vindo ao Flask!'

@app.route('/hello/<name>')
def hello(name):
	return 'Olá, %s!' % name
