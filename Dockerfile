<<<<<<< HEAD
# Step 1: Use Maven image to build the project
FROM maven:3.9.6-eclipse-temurin-17 AS build
=======
# Use JDK base image
FROM openjdk:17-jdk-slim
>>>>>>> f3d54dc42c946d6ee809283689d5fa8010780813

# Set working directory
WORKDIR /app

<<<<<<< HEAD
# Copy pom.xml and download dependencies first (for caching)
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy the source code and build the application
COPY src ./src
RUN mvn package -DskipTests

# Step 2: Use lightweight JRE image to run the app
FROM eclipse-temurin:17-jre-alpine

# Set working directory
WORKDIR /app

# Copy the jar file from the build stage
COPY --from=build /app/target/myapp-1.0-SNAPSHOT.jar app.jar

# Run the app
CMD ["java", "-jar", "app.jar"]
=======
# Copy JAR from target folder (after Maven build)
COPY target/*.jar app.jar

# Expose application port
EXPOSE 8080

# Run the app
ENTRYPOINT ["java", "-jar", "/app.jar"]

>>>>>>> f3d54dc42c946d6ee809283689d5fa8010780813
