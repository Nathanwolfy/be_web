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
