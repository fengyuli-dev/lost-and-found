from hashlib import new
from flask import Flask, request
import json
import os

from db import db, User, Lost, Found

app = Flask(__name__)
db_filename = "lost_and_found.db"

app.config["SQLALCHEMY_DATABASE_URI"] = "sqlite:///%s" % db_filename
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
app.config["SQLALCHEMY_ECHO"] = True

# Helper methods


def extract_token(request):
    bearer_token = request.headers.get("Authorization")
    if bearer_token is None:
        return False, None
    return True, bearer_token


def success_response(response, code=200):
    return json.dumps(response), code


def failure_response(response, code=404):
    return json.dumps(response), code


db.init_app(app)
with app.app_context():
    db.create_all()

# Routes


@app.route("/")
def home():
    return "Backend server for lost & found"


@app.route("/api/register/", methods=["POST"])
def register_account():
    body = json.loads(request.data)
    if body.keys() < {"email", "password"}:
        return failure_response({"error": True}, 400)
    if not User.query.filter_by(email=body["email"]).first() is None:
        return failure_response({"error": True}, 400)
    new_user = User(body["email"], body["password"])
    db.session.add(new_user)
    db.session.commit()
    return success_response({
        "session_token": new_user.session_token,
        "session_expiration": str(new_user.session_expiration),
        "update_token": new_user.update_token,
        "detail": new_user.serialize()
    }, 201)


@app.route("/api/login/", methods=["POST"])
def login():
    body = json.loads(request.data)
    if body.keys() < {"email", "password"}:
        return failure_response({"error": True}, 400)
    user = User.query.filter_by(email=body["email"]).first()
    success = user is not None and user.verify_password(body["password"])
    if not success:
        return failure_response({"error": True}, 401)
    else:
        return success_response({
            "session_token": user.session_token,
            "session_expiration": str(user.session_expiration),
            "update_token": user.update_token,
            "detail": user.serialize()
        }, )


@app.route("/api/session/", methods=["POST"])
def update_session():
    success, update_token = extract_token(request)
    if not success:
        return failure_response({"error": True}, 400)
    user = User.query.filter_by(update_token=update_token).first()
    if user is None:
        return failure_response({"error": True}, 400)
    user.renew_session()
    db.session.commit()
    return success_response({
        "session_token": user.session_token,
        "session_expiration": str(user.session_expiration),
        "update_token": user.update_token
    }, )


@app.route("/secret/", methods=["GET"])
def secret_message():
    pass


@app.route("/api/lost/")
def get_all_lost():
    return success_response([l.serialize() for l in Lost.query.all()])


@app.route("/api/found/")
def get_all_found():
    return success_response([f.serialize() for f in Found.query.all()])


@app.route("/api/lost/<int:lost_id>/")
def get_specific_lost(lost_id):
    lost = Lost.query.filter_by(id=lost_id).first()
    if lost is None:
        return failure_response({"error": True})
    return success_response(lost.serialize())


@app.route("/api/found/<int:found_id>/")
def get_specific_found(found_id):
    found = Found.query.filter_by(id=found_id).first()
    if found is None:
        return failure_response({"error": True})
    return success_response(found.serialize())


@app.route("/api/lost/user/<int:user_id>/")
def get_lost_by_user(user_id):
    user = User.query.filter_by(id=user_id).first()
    if user is None:
        return failure_response({"error": True})
    lost = Lost.query.filter_by(user_id=user_id)
    return success_response([l.serialize() for l in lost])


@app.route("/api/found/user/<int:user_id>/")
def get_found_by_user(user_id):
    user = User.query.filter_by(id=user_id).first()
    if user is None:
        return failure_response({"error": True})
    found = Found.query.filter_by(user_id=user_id)
    return success_response([f.serialize() for f in found])


@app.route("/api/lost/<int:user_id>/", methods=['POST'])
def post_lost_item(user_id):

    user = User.query.filter_by(id=user_id).first()
    if user is None:
        return failure_response({"error": True})

    body = json.loads(request.data)
    if body.keys() < {"name"}:
        return failure_response({"error": True}, 400)

    item = Lost(
        name=body["name"],
        description=body.get("description", None),
        # Use String for time?
        time=body.get("time", None),
        location=body.get("location", None),
        user_id=user_id
    )
    db.session.add(item)
    db.session.commit()
    return success_response(item.serialize(), 201)


@app.route("/api/found/<int:user_id>/", methods=['POST'])
def post_found_item(user_id):

    user = User.query.filter_by(id=user_id).first()
    if user is None:
        return failure_response({"error": True})

    body = json.loads(request.data)
    if body.keys() < {"name"}:
        return failure_response({"error": True}, 400)

    item = Found(
        name=body["name"],
        description=body.get("description", None),
        # Use String for time?
        time=body.get("time", None),
        location=body.get("location", None),
        user_id=user_id
    )
    db.session.add(item)
    db.session.commit()
    return success_response(item.serialize(), 201)


@app.route("/api/user/", methods=['POST'])
def post_user():
    body = json.loads(request.data)
    if body.keys() < {"name"}:
        return failure_response({"error": True}, 400)
    user = User(
        name=body["name"],
    )
    db.session.add(user)
    db.session.commit()
    return success_response(user.serialize(), 201)


@app.route("/api/found/<int:lost_id>", methods=["DELETE"])
def delete_lost_item(lost_id):
    lost = Lost.query.filter_by(id=lost_id).first()
    if lost is None:
        return failure_response({"error": True})
    db.session.delete(lost)
    db.session.commit()
    return success_response(lost.serialize())


@app.route("/api/found/<int:found_id>", methods=["DELETE"])
def delete_found_item(found_id):
    found = Found.query.filter_by(id=found_id).first()
    if found is None:
        return failure_response({"error": True})
    db.session.delete(found)
    db.session.commit()
    return success_response(found.serialize())


if __name__ == "__main__":
    app.run(host="0.0.0.0", port=3000, debug=True)
