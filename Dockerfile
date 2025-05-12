# Use Java 21-compatible Maven image
FROM maven:3.9.6-eclipse-temurin-21 as builder

WORKDIR /app
COPY . .
RUN chmod +x mvnw
RUN ./mvnw clean install -DskipTests

# Use Java 21 JDK at runtime
FROM eclipse-temurin:21-jdk-alpine

WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
