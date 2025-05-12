# Use an official OpenJDK image
FROM openjdk:17-jdk-slim

# Set the working directory inside the container
WORKDIR /app

# Copy Maven wrapper and project files
COPY .mvn .mvn
COPY mvnw pom.xml ./

# Make Maven wrapper executable
RUN chmod +x mvnw

# Download project dependencies
RUN ./mvnw dependency:resolve

# Copy the full project source
COPY . .

# Build the Spring Boot app
RUN ./mvnw clean install -DskipTests

# Expose the port your Spring Boot app runs on
EXPOSE 8080

# Run the app
CMD ["java", "-jar", "target/socialmedia-0.0.1-SNAPSHOT.jar"]
