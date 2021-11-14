from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()


class User(db.Model):
    __tablename__ = "user"
    id = db.Column(db.Integer, primary_key=True, autoincrement=True)
    name = db.Column(db.String, nullable=False)
    lost = db.relationship("Lost", back_populates="user")
    found = db.relationship("Found", back_populates="user")

    def serialize(self):
        return {
            "id": self.id,
            "name": self.name,
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
