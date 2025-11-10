# Étape 1 : Build
FROM eclipse-temurin:17-jdk-jammy AS build
WORKDIR /app
COPY gradlew gradlew.bat settings.gradle build.gradle ./
COPY gradle gradle
RUN chmod +x gradlew
COPY src src
RUN ./gradlew clean build -x test --no-daemon

# Étape 2 : Run
FROM eclipse-temurin:17-jdk-jammy
WORKDIR /app
# Remplace le nom du jar si besoin
COPY --from=build /app/build/libs/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]