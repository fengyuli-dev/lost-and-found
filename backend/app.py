from flask import Flask, request
import json
import os

from db import db

app = Flask(__name__)
db_filename = "lost_and_found.db"

# generalized response formats


def success_response(response, code=200):
    return json.dumps(response), code


def failure_response(response, code=404):
    return json.dumps(response), code


db.init_app(app)
with app.app_context():
    db.create_all()

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=3000, debug=True)
