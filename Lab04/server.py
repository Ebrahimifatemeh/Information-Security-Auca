from flask import Flask, send_from_directory

app = Flask(__name__)

@app.route("/")
def login_page():
    return send_from_directory(".", "instagram-login.html")

@app.route("/email")
def email_template():
    return send_from_directory(".", "email-template.html")

if __name__ == "__main__":
    # Demo server for local viewing only (no data collection)
    app.run(port=8000, debug=True)
