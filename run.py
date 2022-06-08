from gestion_vols.config import DEBUG, WEB_SERVER
from gestion_vols.views import app
from flask import Flask,render_template, request
from flask_mysqldb import MySQL

if __name__ == '__main__':
    app.run(
        host = WEB_SERVER['host'], 
        port = WEB_SERVER['port'],
        debug = DEBUG
    )
    