# Используем официальный образ OpenJDK с Alpine
FROM eclipse-temurin:17-jre-alpine

# Создаем и переходим в рабочую директорию
WORKDIR /app

# Копируем JAR-файл в контейнер (ТОЧНОЕ ИМЯ ВАШЕГО ФАЙЛА)
COPY target/zooPark-0.0.1-SNAPSHOT.jar app.jar

# Открываем порт приложения
EXPOSE 8080

# Запускаем приложение
ENTRYPOINT ["java", "-jar", "app.jar"]