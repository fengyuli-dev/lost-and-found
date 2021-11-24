from flask_sqlalchemy import SQLAlchemy
import os
import bcrypt
import hashlib

db = SQLAlchemy()


class User(db.Model):
    __tablename__ = "user"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    email = db.Column(db.String, nullable=False)
    password_digest = db.Column(db.String, nullable=False)
    lost = db.relationship("Lost", back_populates="user")
    found = db.relationship("Found", back_populates="user")

    def _init_(self, **kwargs):
        self.email = kwargs["email"]
        self.password_digest = bcrypt.hashpw(
            kwargs["password"].encode("utf8"), bcrypt.gensalt(rounds=13))
        self.renew_session()

    # Used to randomly generate session/update tokens
    def _urlsafe_base_64(self):
        return hashlib.sha1(os.urandom(64)).hexdigest()

    def serialize(self):
        return {
            "id": self.id,
            "name": self.username,
            "lost": [l.serialize() for l in self.lost],
            "found": [f.serialize() for f in self.found]
        }


class Lost(db.Model):
    __tablename__ = "lost"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String, nullable=False)
    description = db.Column(db.String, nullable=True)
    time = db.Column(db.Time, nullable=True)
    location = db.Column(db.String, nullable=True)
    user_id = db.Column(db.Integer, db.ForeignKey("user.id"))
    user = db.relationship("User", back_populates="lost")

    def serialize(self):
        return {
            "id": self.id,
            "name": self.name,
            "description": self.description,
            "time": self.time,
            "location": self.location,
            "user": self.user_id
        }


class Found(db.Model):
    __tablename__ = "found"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String, nullable=False)
    description = db.Column(db.String, nullable=True)
    time = db.Column(db.Time, nullable=True)
    location = db.Column(db.String, nullable=True)
    user_id = db.Column(db.Integer, db.ForeignKey("user.id"))
    user = db.relationship("User", back_populates="found")

    def serialize(self):
        return {
            "id": self.id,
            "name": self.name,
            "description": self.description,
            "time": self.time,
            "location": self.location,
            "user": self.user_id
        }
