# Use JDK base image
FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /app

# Copy JAR from target folder (after Maven build)
COPY target/*.jar app.jar

# Expose application port
EXPOSE 8080

# Run the app
ENTRYPOINT ["java", "-jar", "/app.jar"]

