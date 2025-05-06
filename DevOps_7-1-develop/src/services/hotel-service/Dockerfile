# Этап 1: Сборка приложения
FROM maven:3.8.4-jdk-8 AS build

# Устанавливаем рабочую директорию
WORKDIR /app

# Настройка среды Maven(инструмент сборки приложений Java) в контейнере, 
#копируем файл проекта pom.xml
COPY .mvn .mvn
COPY mvnw pom.xml ./
# Загружаем все зависимости, необходимые проекту. 
RUN mvn -B dependency:go-offline

# Копируем исходный код проекта
COPY src ./src

# Собираем приложение в пакетном режиме -B, в файл JAR package, 
#-DskipTests пропустить запуск модульных тестов во время процесса сборки.
RUN mvn -B package -DskipTests

# Этап 2: Cозданиe образа Docker для приложений Java, облегченный дистрибутив Linux в качестве базового образа.
# Запуск приложения в отдельном контейнере
FROM openjdk:8-jdk-alpine

# Копируем собранное приложение из предыдущего этапа
COPY --from=build /app/target/*.jar /app/app.jar
COPY wait-for-it.sh .

EXPOSE 8082

# Установливаем ​​последнюю версию Bash
RUN apk add --no-cache bash
# Ожидаем пока служба PostgreSQL станет доступной 
RUN chmod +x wait-for-it.sh

# Запускаем приложение c ожиданием запуска зависимых служб
# Если служба не станет доступна в течение 60 секунд, скрипт завершит работу с ошибкой
# Каждая служба указывается как имя хоста и номер порта
CMD ["./wait-for-it.sh", "-t", "60", "postgres:5432", "--", \
     "./wait-for-it.sh", "-t", "60", "rabbitmq:5672", "--", \
     "java", "-jar", "/app/app.jar"]