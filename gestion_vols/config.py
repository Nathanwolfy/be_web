DEBUG = True

WEB_SERVER = {"host": "localhost",
            "port":8080,} #Configuration du serveur de BDD

#Configuration du serveur de BDD
DB_SERVER = {
"user": "root",
"password": "mysql",
"host": "localhost",
"port": 3306, #8889 si MAC
"database": "gsea_cours", #nom de la BDD
"raise_on_warnings": True
}


SECRET_KEY="79a6a933dfc9b1975e444d4e8481c64c771d8ab40b7ac72f8bc1a1bca1718bef"