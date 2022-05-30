import mailbox
from xml.dom import NoModificationAllowedErr
from flask import Flask, render_template, session, request, redirect, make_response
from .controller import functions, hashage_mdp
from .controller import bdd as bdd
import pandas, os
from werkzeug.utils import secure_filename
from openpyxl import Workbook

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
    password = hashage_mdp.hash_mdp(request.form['mdp'])
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

#gestion des fichiers
@app.route("/fichiers")
@app.route("/fichiers/<infoMsg>")
@app.route("/fichiers", methods=["POST"])
def fichiers(infoMsg = ''):
    if "data" in request.files:
        file = request.files['testFile']
        #enregistrement du fichier dans le repertoire files
        filename = secure_filename(file.filename)
        UPLOAD_FOLDER = "myApp/static/files/"
        file.save(os.path.join(UPLOAD_FOLDER, filename))
        #enregistrement du fichier sur le serveur
        xls = pandas.read_excel(UPLOAD_FOLDER+file.filename)
        data = xls.to_dict('records')
        print([file.filename, data])
        #enregistrement des donnees en bdd
        msg = bdd.saveDataFromFile(data)
        print(msg)
        if msg == "addDataFromFileOK":
            return redirect("/sgbd/importDataOK")
        else :
            return redirect("/fichiers/importDataEchec")
    else :
        return render_template("cours/fichiers.html", info = infoMsg)

@app.route("/addMembre",methods=['POST'])
def addMembre():
    nom=request.form['NOM']
    prenom=request.form['prenom']
    mail=request.form['sonMail']
    login=request.form['login']
    motPasse=request.form['motPasse']
    statut=request.form['rad[]']
    avatar=request.form['avatar']
    msg,lastId=bdd.add_UserData(nom,prenom,mail,login,motPasse,statut,avatar)
    if msg=="OK add user":
        return redirect("/compte/addUserOK")
    else:
        return redirect("/compte/addUserProblem")

#exporter les donnees dans un fichier
@app.route("/exportToExcel")
def exportToExcel():
    msg, listeEvents = bdd.get_tableData("events")
    wb = Workbook()
    sheet = wb.active
    
    headers = [x for x in listeEvents[[0]]]
    
    for index, value in enumerate(headers):
        sheet.cell(row=1, column= index+1).value = value
    for i, x in enumerate(listeEvents):
        for idx, value in enumerate(x.values()):
               sheet.cell(row=i+2, column=idx+1).value = value
    wb.save('myApp/static/files/export.xls')
    return redirect('/static/files/export.xls')
               
