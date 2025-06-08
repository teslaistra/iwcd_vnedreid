# Проект Lamoda Seller

Flutter-приложение. Веб-версия собирается нативно и через Docker Compose (экспериментально).

## Нативная сборка (проверено)
```bash
cd lamoda_seller
flutter pub get
flutter build web
```

Артефакты сборки: `lamoda_seller/build/web`

## Docker-сборка (не тестировалась)

### Требования:
- Docker
- Docker Compose

### Инструкция:
1. Сборка и запуск:
```bash
docker-compose up --build
```

2. Приложение будет доступно по адресу:  
   http://localhost:8080

3. Остановка:
```bash
docker-compose down
```

**Важно:** Нативная сборка гарантированно работает. Docker-сборка реализована, но не была протестирована из-за ограничений времени на хакатоне.

## Структура проекта
```
.
├── lamoda_seller/      # Исходный код Flutter
├── docker-compose.yml
└── nginx.conf
```