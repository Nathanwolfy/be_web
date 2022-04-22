from flask import Flask, render_template
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
def connexion():
    return render_template("connexion.html")

@app.route("/portfolio-details")
def portfolio_details():
    return render_template("portfolio-details.html")

@app.route("/portfolio")
def portfolio():
    return render_template("portfolio.html")

@app.route("/services")
def services():
    return render_template("services.html")

@app.route("/team")
def team():
    return render_template("team.html")