# Stage 1: Build the WAR file
FROM ubuntu:20.04 as builder

# Install dependencies and tools
RUN apt-get update \
    && apt-get install -y \
        ant \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /work

COPY application/ /work/

RUN ant war

# Stage 2: Run Tomcat and deploy the WAR file
FROM tomcat:9.0.56-jdk11-corretto

# Set the working directory
WORKDIR /usr/local/tomcat/webapps/

# Copy the WAR file from the previous stage
COPY --from=builder /war/coffeeapp.war . 

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
