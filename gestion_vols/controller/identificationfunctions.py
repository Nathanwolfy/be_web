from flask import session
from . import bdd

def verifAuth(login, mdp):
    session.clear()#suppression sessions précédentes
    msg, user = bdd.verifAuthData(login, mdp)
    print(msg)
    try:
        #authentification réussie
        #initialisation des sessions
        session["idUser"] = user["idUser"]
        session["nom"] = user["nom"]
        session["prenom"] = user["prenom"]
        session["mail"] = user["mail"]
        session["statut"] = user["statut"]
        session["avatar"] = user["avatar"]
        info = msg
    except TypeError as err:
        info="authEchec"
        print("Failed verifAuth : {}".format(err))
        return info

