from flask import Flask, request, jsonify
from flask_sqlalchemy import SQLAlchemy
from flask_cors import CORS
import os
import time

app = Flask(__name__)
CORS(app)
app.config["SQLALCHEMY_DATABASE_URI"] = (
    "mysql+pymysql://user:userpassword@db:3306/mydatabase"
)
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = False
db = SQLAlchemy(app)


class Entry(db.Model):
    __tablename__ = "personal_entries"
    id = db.Column(db.Integer, primary_key=True)
    nome = db.Column(db.String(100), nullable=False)
    email = db.Column(db.String(100), nullable=False)


@app.route("/entries", methods=["POST"])
def add_entry():
    nome = request.json.get("nome")
    email = request.json.get("email")
    new_entry = Entry(nome=nome, email=email)
    db.session.add(new_entry)
    db.session.commit()
    return jsonify({"id": new_entry.id}), 201


@app.route("/entries", methods=["GET"])
def get_entries():
    entries = Entry.query.all()
    return jsonify(
        [
            {"id": entry.id, "nome": entry.nome, "email": entry.email}
            for entry in entries
        ]
    )


def wait_for_db():
    """Aguarda a conexão com o banco de dados"""
    max_retries = 30
    for i in range(max_retries):
        try:
            with app.app_context():
                db.create_all()
                print("Database connected and tables created!")
                break
        except Exception as e:
            if i == max_retries - 1:
                print(
                    f"Failed to connect to database after {max_retries} attempts: {e}"
                )
                raise
            print(f"Waiting for database... ({i+1}/{max_retries})")
            time.sleep(2)


if __name__ == "__main__":
    wait_for_db()
    app.run(host="0.0.0.0", port=5000)
