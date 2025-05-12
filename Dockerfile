# Use Maven to build the app
FROM maven:3.9.6-eclipse-temurin-17 as builder

WORKDIR /app
COPY . .

# Grant execute permission to mvnw
RUN chmod +x mvnw

# Build the application (skip tests for faster deploys)
RUN ./mvnw clean install -DskipTests

# Use lightweight JDK for runtime
FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]

