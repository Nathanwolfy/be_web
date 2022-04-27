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

#fonction pour avoir le last id d'une table
def last_id_table(table):
    try:
        cnx, error = connexion()
        if error is not None:
            return error, None #pb de connection a la bdd
        cursor = cnx.cursor(dictionary=True)
        sql = "SELECT * FROM {}".format(table)
        last_id = cursor.lastrowid
        close_bd(cursor, cnx)
        msg = "OK get last id"
    except mysql.connector.Error as err :
        last_id = None
        msg = "Failed get aeroclub data : {}".format(err)
    return msg, last_id

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
        last_id = None
        msg = "Failed add aeroclub data : {}".format(err)
    return msg, last_id

#fonctions de la table avions
def get_avionsData():
    try:
        cnx, error = connexion()
        if error is not None:
            return error, None #pb de connection a la bdd
        cursor = cnx.cursor(dictionary=True)
        sql = "SELECT * FROM avions"
        cursor.execute(sql)
        liste_avions = cursor.fetchall()
        close_bd(cursor, cnx)
        msg = "OK get data in avions"
    except mysql.connector.Error as err :
        liste_avions = None
        msg = "Failed get avions data : {}".format(err)
    return msg, liste_avions

def add_avionsData(param_immatAvion_avions, param_typeAvion_avions, param_idAeroclub_avions):
#    last_id_aeroclub_possible = last_id_table("aeroclub")[1]
#    if param_idAeroclub_avions > last_id_aeroclub_possible or param_idAeroclub_avions < 1:
#        return "Failed add avions data : id_aeroclub does not match with database"
    try:
        cnx, error = connexion()
        cursor = cnx.cursor()
        sql = "INSERT INTO avions (immatAvion, typeAvion, idAeroclub) VALUES (%s, %s, %s)"
        param = (param_immatAvion_avions, param_typeAvion_avions, param_idAeroclub_avions)
        cursor.execute(sql, param)
        last_id = cursor.lastrowid #dernier id_avion utilise pour l'auto incrementation
        cnx.commit()
        close_bd(cursor, cnx)
        msg = "OK add avions"
    except mysql.connector.Error as err:
        last_id = None
        msg = "Failed add avions data : {}".format(err)
    return msg, last_id

#fonctions de la table events
def get_eventsData():
    try:
        cnx, error = connexion()
        if error is not None:
            return error, None #pb de connection a la bdd
        cursor = cnx.cursor(dictionary=True)
        sql = "SELECT * FROM events"
        cursor.execute(sql)
        liste_events = cursor.fetchall()
        close_bd(cursor, cnx)
        msg = "OK get data in events"
    except mysql.connector.Error as err :
        liste_events = None
        msg = "Failed get events data : {}".format(err)
    return msg, liste_events

def add_eventsData(param_start_date_events, param_end_date_events, param_text_events, param_idAvion_events, param_idType_events, param_idUserReserver_events, param_idUserEnseigner_events):
    try:
        cnx, error = connexion()
        cursor = cnx.cursor()
        sql = "INSERT INTO events (start_date, end_date, text, idAvion, idType, idUserReserver, idUserEnseigner) VALUES (%s, %s, %s, %s, %s, %s, %s)"
        param = (param_start_date_events, param_end_date_events, param_text_events, param_idAvion_events, param_idType_events, param_idUserReserver_events, param_idUserEnseigner_events)
        cursor.execute(sql, param)
        last_id = cursor.lastrowid #dernier id_events utilise pour l'auto incrementation
        cnx.commit()
        close_bd(cursor, cnx)
        msg = "OK add events"
    except mysql.connector.Error as err:
        last_id = None
        msg = "Failed add events data : {}".format(err)
    return msg, last_id

def del_eventsData(param_idEvent_events):
    try:
        cnx, error = connexion()
        cursor = cnx.cursor()
        sql = "DELETE FROM events WHERE idEvent = %s"
        param = (param_idEvent_events,)
        cursor.execute(sql, param)
        cnx.commit()
        close_bd(cursor, cnx)
        msg = "OK del event"
    except mysql.connector.Error as err :
        msg = "Failed del event data : {}".format(err)
    return msg

def update_eventsData(idEvent, champ, newvalue):
    try:
        cnx, error = connexion()
        cursor = cnx.cursor()
        sql = "UPDATE events SET "+champ+" = %s WHERE idEvent = %s"
        param = (newvalue, idEvent)
        cursor.execute(sql, param)
        cnx.commit()
        close_bd(cursor, cnx)
        msg = "OK update event"
    except mysql.connector.Error as err:
        msg = "Failed update event data : {}".format(err)
    return msg

#fonctions de la table typeVol
def get_typeVolData():
    try:
        cnx, error = connexion()
        if error is not None:
            return error, None #pb de connection a la bdd
        cursor = cnx.cursor(dictionary=True)
        sql = "SELECT * FROM typeVol"
        cursor.execute(sql)
        liste_events = cursor.fetchall()
        close_bd(cursor, cnx)
        msg = "OK get data in typeVol"
    except mysql.connector.Error as err :
        liste_events = None
        msg = "Failed get typeVol data : {}".format(err)
    return msg, liste_events

def add_typeVolData(param_nomTypeVol_typeVol):
    try:
        cnx, error = connexion()
        cursor = cnx.cursor()
        sql = "INSERT INTO typeVol (nomTypeVol) VALUES (%s)"
        param = (param_nomTypeVol_typeVol,)
        cursor.execute(sql, param)
        last_id = cursor.lastrowid #dernier idTypeVol utilise pour l'auto incrementation
        cnx.commit()
        close_bd(cursor, cnx)
        msg = "OK add typeVol"
    except mysql.connector.Error as err:
        last_id = None
        msg = "Failed add typeVol data : {}".format(err)
    return msg, last_id
