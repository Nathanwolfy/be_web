import mysql.connector
from mysql.connector import errorcode
from ..config import DB_SERVER

# connexion au serveur de BDD
def connexion():
    cnx = ""
    try:
        cnx = mysql.connector.connect(**DB_SERVER)
        error = None
    except mysql.connector.Error as err:
        error = err
        if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
            print("Mauvais login ou mot de passe")
        elif err.errno == errorcode.ER_BAD_DB_ERROR:
            print("La Base de données n'existe pas.")
        else:
            print(err)
    return cnx, error # error: remonte problème connexion

# fermeture de la connexion au serveur de BDD
def close_bd(cursor, cnx):
    cursor.close()
    cnx.close()

def verifAuthData(login, mdp):
    try:
        cnx, error = connexion()
        if error is not None:
            return error, None
        cursor = cnx.cursor(dictionary=True)
        sql = "SELECT * FROM identification WHERE login=%s and motPasse=%s"
        param=(login, mdp)
        cursor.execute(sql, param)
        user = cursor.fetchone()
        print(user)
        close_bd(cursor, cnx)
        msg = "authOK"
    except mysql.connector.Error as err:
        user = None
        msg = "Failed get Auth data : {}".format(err)
    return msg, user

#fonctions de la table aeroclub
def get_aeroclubData():
    try:
        cnx, error = connexion()
        if error is not None:
            return error, None #pb de connection a la bdd
        cursor = cnx.cursor(dictionary=True)
        sql = "SELECT * FROM aeroclub"
        cursor.execute(sql)
        liste_aeroclub = cursor.fetchall()
        close_bd(cursor, cnx)
        msg = "OK get data in aeroclub"
    except mysql.connector.Error as err :
        liste_aeroclub = None
        msg = "Failed get aeroclub data : {}".format(err)
    return msg, liste_aeroclub

def add_aeroclubData(param_nom_aeroclub, param_color_aeroclub):
    try:
        cnx, error = connexion()
        cursor = cnx.cursor()
        sql = "INSERT INTO aeroclub (nomAeroclub, color) VALUES (%s, %s)"
        param = (param_nom_aeroclub, param_color_aeroclub)
        cursor.execute(sql, param)
        last_id = cursor.lastrowid #dernier id_aeroclub utilise pour l'auto incrementation
        cnx.commit()
        close_bd(cursor, cnx)
        msg = "OK add aeroclub"
    except mysql.connector.Error as err:
        msg = "Failed add aeroclub data : {}".format(err)
    return msg, last_id

#fonctions de la table avions
