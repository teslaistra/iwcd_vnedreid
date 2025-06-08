from fastapi import FastAPI, HTTPException
import os
import asyncio
from fastapi.middleware.cors import CORSMiddleware

from chats import chat_router, initialize_search_index_async

# --- FastAPI app ---
app = FastAPI(
    title="Backend API",
    description="Backend с авторизацией и AI Chat API",
    version="1.0.0",
)

origins = [
    "http://localhost:3000",   # если фронт на React/Next локально
    "*",
    "https://your-production-frontend.com",  # сюда добавь домен прод фронта
]

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Можно поставить ["*"] чтобы разрешить всем — но осторожно!
    allow_credentials=True,
    allow_methods=["*"],    # Разрешить все HTTP-методы (GET, POST и т.п.)
    allow_headers=["*"],    # Разрешить любые заголовки
)

@app.on_event("startup")
async def startup_event():
    # Запускаем initialize_search_index_async в background
    asyncio.create_task(initialize_search_index_async())

# --- Корневая ручка ---
@app.get("/", summary="Проверка работы API")
async def root():
    return {"message": "Backend is running."}

# # --- Подключаем чат router ---
app.include_router(chat_router)

PORT = int(os.environ.get("PORT", "8080"))

if __name__ == "__main__":
    import uvicorn
    uvicorn.run("main:app", host="0.0.0.0", port=PORT)
