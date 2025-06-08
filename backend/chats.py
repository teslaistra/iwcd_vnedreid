from fastapi import APIRouter, HTTPException
from pydantic import BaseModel, Field
import uuid
import pathlib
import json
from yandex_cloud_ml_sdk import YCloudML
from yandex_cloud_ml_sdk.search_indexes import VectorSearchIndexType
from yandex_cloud_ml_sdk import YCloudML
from yandex_cloud_ml_sdk.search_indexes import (
    StaticIndexChunkingStrategy,
    TextSearchIndexType,
)
# --- Конфиг ---
FOLDER_ID = "b1gkt0nf70djqld0v9ub"
API_KEY = "AQVNxykpZrpj75Ah9_idD0ZqZiDEA5rWo9HpfEt-"
DATA_PATH = "./articles_text"
TEXT_INFO_PATH = "./articles_titles.json"

sdk = YCloudML(folder_id=FOLDER_ID, auth=API_KEY)

tool = None  # глобально объявляем пустую переменную

async def initialize_search_index_async():
    global tool
    print("[chat] Uploading files and creating search index (async)...")
    files = upload_files()  # upload_files — sync, можно обернуть в thread pool
    search_index = create_index(files)  # тоже sync
    tool = sdk.tools.search_index(search_index)
    print("[chat] Search index created.")

# --- Загрузка файлов ---
def upload_files():
    file_labels = []
    with open(TEXT_INFO_PATH, "r") as f:
        text_info = json.load(f)
    for url, title in text_info.items():
        # теперь ключ — URL, значение — title
        file_labels.append({url: title})

    paths = pathlib.Path(DATA_PATH).glob("*.txt")
    files = []
    for path, label in zip(paths, file_labels):
        file = sdk.files.upload(
            path,
            ttl_days=5,
            expiration_policy="static",
            name=str(path),
            labels=label
        )
        files.append(file)
    return files

# --- Создание индекса ---
def create_index(files):
    # operation = sdk.search_indexes.create_deferred(
    #     files,
    #     index_type=VectorSearchIndexType(),
    #     name="support-index",
    #     labels={"support": "Индекс поддержки пользователей"}
    # )

    operation = sdk.search_indexes.create_deferred(
        files,
        index_type=TextSearchIndexType(
            chunking_strategy=StaticIndexChunkingStrategy(
                max_chunk_size_tokens=700,
                chunk_overlap_tokens=300,
            )
        ),
    )
    return operation.wait()

# --- При старте ---
# print("[chat] Uploading files and creating search index...")
# files = upload_files()
# search_index = create_index(files)
# tool = sdk.tools.search_index(search_index)
# print("[chat] Search index created.")

# --- Храним сессии чата ---
chat_sessions = {}

# --- API Router ---
chat_router = APIRouter(
    prefix="/chat",
    tags=["Chat"],
    responses={404: {"description": "Not found"}},
)

# --- Модели данных ---
class InitChatResponse(BaseModel):
    session_id: str = Field(..., description="Уникальный идентификатор сессии чата")

class ChatMessageRequest(BaseModel):
    session_id: str = Field(..., description="Уникальный идентификатор сессии чата")
    message: str = Field(..., description="Сообщение пользователя")

class Citation(BaseModel):
    source_text: str = Field(..., description="Текст источника")
    file_name: str = Field(..., description="Имя файла-источника без .txt (техническое)")
    source_url: str = Field(..., description="URL на источник")
    source_title: str = Field(..., description="Название статьи или раздела")

class ChatMessageResponse(BaseModel):
    reply: str = Field(..., description="Ответ ассистента")
    citations: list[Citation] = Field(default_factory=list, description="Список источников")

class EndChatRequest(BaseModel):
    session_id: str = Field(..., description="ID сессии для завершения")

# --- Ручка /chat/init ---
@chat_router.post("/init", response_model=InitChatResponse, summary="Создать сессию чата")
async def init_chat():
    if tool is None:
        raise HTTPException(status_code=503, detail="Index is initializing, please try again later.")

    assistant = sdk.assistants.create("yandexgpt", tools=[tool], instruction='ты умный ассистент компании Lamoda для помощи селлерам. если пользователь просит позвать оператора, то попроси его написать сообщение и скажи что будет создан тикет в техническую поддержку. отвечай как живой человек без слов, например на основании представленного контекста.')
    thread = sdk.threads.create()

    session_id = str(uuid.uuid4())
    chat_sessions[session_id] = {
        "assistant": assistant,
        "thread": thread
    }
    return InitChatResponse(session_id=session_id)

# --- Ручка /chat/message ---
@chat_router.post("/message", response_model=ChatMessageResponse, summary="Отправить сообщение в чат")
async def chat_message(req: ChatMessageRequest):
    session = chat_sessions.get(req.session_id)
    if not session:
        raise HTTPException(status_code=404, detail="Session not found")

    thread = session["thread"]
    assistant = session["assistant"]

    thread.write(req.message)
    run = assistant.run(thread)
    result = run.wait()

    citations_data = []
    for citation in result.citations:
        for source in citation.sources:
            file_name_full = source.file.name
            file_name_no_ext = file_name_full.replace(".txt", "")
            file_labels = source.file.labels
            if file_labels:
                source_url = next(iter(file_labels.keys()))
                source_title = file_labels[source_url]
            else:
                source_url = "https://lamoda.academy-seller.ru"
                source_title = "Источник не определен"

            citations_data.append({
                "source_text": source.text,
                "file_name": file_name_no_ext,
                "source_url": source_url,
                "source_title": source_title
            })

    return ChatMessageResponse(
        reply=result.text,
        citations=[Citation(**c) for c in citations_data]
    )

# --- Ручка /chat/end ---
@chat_router.post("/end", summary="Завершить сессию чата")
async def end_chat(req: EndChatRequest):
    session = chat_sessions.pop(req.session_id, None)
    if not session:
        raise HTTPException(status_code=404, detail="Session not found")

    session["thread"].delete()
    session["assistant"].delete()

    return {"success": True, "detail": "Chat session ended."}
