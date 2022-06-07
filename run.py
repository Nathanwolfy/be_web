from gestion_vols.config import DEBUG, WEB_SERVER
from gestion_vols.views import app

if __name__ == '__main__':
    app.run(
        host = WEB_SERVER['host'], 
        port = WEB_SERVER['port'],
        debug = DEBUG
    )
    