from flask import Flask, render_template, session, request, redirect
from .controller import identificationfunctions
app = Flask(__name__)
app.template_folder= "template"
app.static_folder= "static"
app.config.from_object('gestion_vols.config')

@app.route("/")
@app.route("/index")
def index():
    return render_template("index.html")

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
    msg = identificationfunctions.verifAuth(login, password)
    print(msg)
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