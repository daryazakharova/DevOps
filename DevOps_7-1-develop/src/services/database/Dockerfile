# Используем официальный образ PostgreSQL
FROM postgres:16.2-alpine

# Устанавливаем рабочую директорию
WORKDIR /app

# Копируем скрипт инициализации базы данных
COPY init.sql /docker-entrypoint-initdb.d/
USER postgres

# Объявляем порт, на котором будет доступна база данных
EXPOSE 5432