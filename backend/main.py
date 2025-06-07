from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
import os
import sqlite3

DB_PATH = os.environ.get("APP_DB", "users.db")

conn = sqlite3.connect(DB_PATH, check_same_thread=False)
conn.execute(
    "CREATE TABLE IF NOT EXISTS users (id INTEGER PRIMARY KEY AUTOINCREMENT, username TEXT UNIQUE, password TEXT)"
)

DEFAULT_USERNAME = os.environ.get("APP_USERNAME", "admin")
DEFAULT_PASSWORD = os.environ.get("APP_PASSWORD", "secret")
cur = conn.execute("SELECT id FROM users WHERE username=?", (DEFAULT_USERNAME,))
if cur.fetchone() is None:
    conn.execute("INSERT INTO users (username, password) VALUES (?, ?)", (DEFAULT_USERNAME, DEFAULT_PASSWORD))
    conn.commit()

app = FastAPI()

class Login(BaseModel):
    username: str
    password: str

@app.post("/login")
async def login(data: Login):
    cur = conn.execute(
        "SELECT id FROM users WHERE username=? AND password=?",
        (data.username, data.password),
    )
    row = cur.fetchone()
    if row:
        return {"success": True, "id": row[0]}
    raise HTTPException(status_code=401, detail="Invalid credentials")

@app.get("/")
async def root():
    return {"message": "Backend is running"}
