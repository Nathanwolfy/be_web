from flask import Flask, render_template, session, request, redirect, make_response
from .controller import functions
from .controller import bdd as bdd

app = Flask(__name__)
app.template_folder= "template"
app.static_folder= "static"
app.config.from_object('gestion_vols.config')

@app.route("/")
@app.route("/index")
@app.route("/index/<infoMsg>")
def index(infoMsg=''):
    return render_template("index.html", info=infoMsg)

@app.route("/about")
def about():
    return render_template("about.html")

@app.route("/blog")
def blog():
    return render_template("blog.html")

@app.route("/connexion")
@app.route("/connexion/<infoMsg>")
def connexion(infoMsg=''):
    return render_template("connexion.html", info=infoMsg)

@app.route("/logout")
def logout():
    session.clear()
    return redirect("/connexion/logoutOK")

@app.route("/login", methods=["POST"])
def login():
    login = request.form['login']
    password = request.form['mdp']
    msg = functions.verifAuth(login, password)
    if "idUser" in session:
        return redirect("/index/authOK")
    else:
        return redirect("/connexion/authEchec")

@app.route("/services")
def services():
    return render_template("services.html")

@app.route("/team")
def team():
    return render_template("team.html")

@app.route("/compte")
def compte():
    return render_template("compte.html")

@app.errorhandler(404)
def page_not_found(erreur):
    return make_response( render_template("404.html"), 404)
