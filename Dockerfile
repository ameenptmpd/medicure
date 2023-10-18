# Use the official OpenJDK 11 image as the base image
FROM openjdk:11

# Copy the JAR file from the target directory to the image
COPY target/*.jar app.jar

# Copy the HTML files from the resources/static directory to the image
COPY src/main/webapp/ /static/

# Set the working directory
WORKDIR /

# Define the entry point to run the Java application
ENTRYPOINT ["java", "-jar", "app.jar"]
