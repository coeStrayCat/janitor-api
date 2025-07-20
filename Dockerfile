FROM eclipse-temurin:21 AS build

WORKDIR /app
COPY . .

# รัน Gradle พร้อม flag ให้แสดง log แบบละเอียด
RUN ./gradlew clean build -x test \
    --refresh-dependencies \
    --stacktrace \
    --info \
    --no-daemon

FROM openjdk:21-slim
WORKDIR /app
COPY --from=build /app/build/libs/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
