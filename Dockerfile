
FROM eclipse-temurin:21-alpine AS build

WORKDIR /app

COPY . .

RUN ./gradlew clean build -x test \
    -Dhttp.socketTimeout=600000 \
    -Dhttp.connectionTimeout=600000 \
    --refresh-dependencies

FROM openjdk:21-slim
WORKDIR /app
COPY --from=build /app/build/libs/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
