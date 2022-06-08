import mysql.connector
from mysql.connector import errorcode
from ..config import DB_SERVER


def connexion():
    """cette fonction est pour se connecter au serveur de bdd"""
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
    return cnx, error # error: remonte probleme connexion


def close_bd(cursor, cnx):
    """cette fonction est pour la fermeture de la connexion au serveur de la bdd"""
    cursor.close()
    cnx.close()


def verifAuthData(login, mdp):
    """cette fonction est pour recuperer toutes les donnees d'un utilisateur sous
    reserve que cet utilisateur existe, avec son login et mot de passe"""
    try:
        cnx, error = connexion()
        if error is not None:
            return error, None
        cursor = cnx.cursor(dictionary=True)
        sql = "SELECT * FROM identification WHERE login=%s and motPasse=%s"
        param=(login, mdp)
        cursor.execute(sql, param)
        user = cursor.fetchone()
        close_bd(cursor, cnx)
        msg = "authOK"
    except mysql.connector.Error as err:
        user = None
        msg = "Failed get Auth data : {}".format(err)
    return msg, user


def last_id_table(table):
    """cette fonction est pour recuperer le last Id d'une table dans le cas
    ou nous voulons ajouter un element, en pratique nous utilisons l'auto
    incrementation et laissons l'Id en Null"""
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

def get_tableData(table):
    """cette fonction est utilisee pour recuperer les donnees des differentes tables"""
    try:
        cnx, error = connexion()
        if error is not None:
            return error, None #pb de connection a la bdd
        cursor = cnx.cursor(dictionary=True)
        sql = "SELECT * FROM "+table
        cursor.execute(sql)
        list_data = cursor.fetchall()
        close_bd(cursor, cnx)
        msg = "OK get data from "+table
    except mysql.connector.Error as err :
        list_data = None
        msg = "Failed get "+table+" data : {}".format(err)
    return msg, list_data

#Ici les differentes fonctions de 4 parmis les 5 tables sont :
#get_aeroclubData() = get_tableData("aeroclub")
#get_avionsData() = get_tableData("avions")
#get_eventsData() = get_tableData("events")
#get_typeVolData() = get_tableData("typeVol")

#fonctions de la table aeroclub
def add_aeroclubData(param_nom_aeroclub, param_color_aeroclub):
    try:
        cnx, error = connexion()
        if error is not None:
            return error, None #pb de connection a la bdd
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
def add_avionsData(param_immatAvion_avions, param_typeAvion_avions, param_idAeroclub_avions):
    try:
        cnx, error = connexion()
        if error is not None:
            return error, None #pb de connection a la bdd
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
def add_eventsData(param_start_date_events, param_end_date_events, param_text_events, param_idAvion_events, param_idTypeVol_events, param_idUserReserver_events, param_idUserEnseigner_events):
    try:
        cnx, error = connexion()
        if error is not None:
            return error, None #pb de connection a la bdd
        cursor = cnx.cursor()
        sql = "INSERT INTO events (start_date, end_date, text, idAvion, idTypeVol, idUserReserver, idUserEnseigner) VALUES (%s, %s, %s, %s, %s, %s, %s)"
        param = (param_start_date_events, param_end_date_events, param_text_events, param_idAvion_events, param_idTypeVol_events, param_idUserReserver_events, param_idUserEnseigner_events)
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
        if error is not None:
            return error, None #pb de connection a la bdd
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
        if error is not None:
            return error, None #pb de connection a la bdd
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
def add_typeVolData(param_nomTypeVol_typeVol):
    try:
        cnx, error = connexion()
        if error is not None:
            return error, None #pb de connection a la bdd
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

#fonctions de la table identification
def add_userData(param_nom_identification, param_prenom_identification, param_mail_identification, param_login_identification, param_motPasse_identification, param_statut_identification, param_avatar_identification):
    try:
        cnx, error = connexion()
        if error is not None:
            return error, None #pb de connection a la bdd
        cursor = cnx.cursor()
        sql = "INSERT INTO identification (nom, prenom, mail, login, motPasse, statut, avatar) VALUES (%s, %s, %s, %s, %s, %s, %s)"
        param = (param_nom_identification, param_prenom_identification, param_mail_identification, param_login_identification, param_motPasse_identification, param_statut_identification, param_avatar_identification)
        cursor.execute(sql, param)
        last_id = cursor.lastrowid #dernier idUser utilise pour l'auto incrementation
        cnx.commit()
        close_bd(cursor, cnx)
        msg = "OK add user"
    except mysql.connector.Error as err:
        last_id = None
        msg = "Failed add user data : {}".format(err)
    return msg, last_id

def update_userData(idUser, champ, newvalue):
    try:
        cnx, error = connexion()
        if error is not None:
            return error, None #pb de connection a la bdd
        cursor = cnx.cursor()
        sql = "UPDATE identification SET "+champ+" = %s WHERE idEvent = %s"
        param = (newvalue, idUser)
        cursor.execute(sql, param)
        cnx.commit()
        close_bd(cursor, cnx)
        msg = "OK update user"
    except mysql.connector.Error as err:
        msg = "Failed update user data : {}".format(err)
    return msg

#la fonctions verifAuthData est situee au dessus

def saveDataFromFile(data):
    try:
        cnx, error = connexion()
        if error is not None:
            return error
        cursor = cnx.cursor()
        #sql1 = "TRUNCATE TABLE events" #suppression des donnees precedentes
        #cursor.execute(sql1)
        #insertion des nouvelles donnees, on pourrait passer par add_userData() mais il n'est pas
        #optimise d'ouvrir et fermer la base de donnee pour chaque data inseree
        for d in data:
            

            if str(d["idUserEnseigner"]) == "nan" :
                sql = "INSERT INTO events (start_date, end_date, text, idAvion, idTypeVol, idUserReserver) VALUES (%s, %s, %s, %s, %s, %s)"
                param = (d["start_date"], d["end_date"], d["text"], d["idAvion"], d["idTypeVol"], d["idUserReserver"])
                cursor.execute(sql, param)
                cnx.commit()
                
            else :
                sql = "INSERT INTO events (start_date, end_date, text, idAvion, idTypeVol, idUserReserver, idUserEnseigner) VALUES (%s, %s, %s, %s, %s, %s, %s)"
                param = (d["start_date"], d["end_date"], d["text"], d["idAvion"], d["idTypeVol"], d["idUserReserver"], d["idUserEnseigner"])
                cursor.execute(sql, param)
                cnx.commit()

        close_bd(cursor, cnx)
        msg = "addDataFromFileOK"
    except mysql.connector.Error as err:
        msg = "Failed saveDataFromFile data : {}".format(err)
    return msg

"""""
def disponibilite_avion(param_idAvion, param_start_date, param_end_date):
    disp = True
    try:
        cnx, error = connexion()
        if error is not None:
            return disp, error #pb de connection a la bdd
        cursor = cnx.cursor(dictionary=True)
        sql = "SELECT start_date, end_date FROM events WHERE idAvion = %s"
        cursor.execute(sql, (param_idAvion,))
        list_data = cursor.fetchall()
        close_bd(cursor, cnx)
        msg = "OK get start_date from events"
    except mysql.connector.Error as err :
        list_data = None
        msg = "Failed get events start_date : {}".format(err)
    
    list_same_day_events = []
    for d in list_data :
        if param_start_date.split()[0] == d[0].split()[0]
            disp = False
            list_same_day_events.append(d)
    if disp :           #retourne True si aucun enregistrement n'est programmé ce jour
        return disp
    
    for d in list_same_day_events:
        if  int(d[0].split()[1].split(":")[0]) int(param_start_date.split()[1].split(":")[0]) 
"""