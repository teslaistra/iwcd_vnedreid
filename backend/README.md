# Backend

Simple FastAPI application with basic username/password authentication stored in an SQLite database.

## Endpoints

- `POST /login` - Accepts JSON with `username` and `password`. Returns `{"success": true, "id": user_id}` if credentials are valid.
- `GET /` - Health check endpoint.

On startup a SQLite database is created (path defined by `APP_DB`, default `users.db`).
If no user exists, one is inserted using `APP_USERNAME` and `APP_PASSWORD` (defaults `admin`/`secret`).
