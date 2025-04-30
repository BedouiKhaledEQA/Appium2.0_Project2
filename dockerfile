FROM maven:3.9.5-eclipse-temurin-17

WORKDIR /app

# Copie de ton projet Java/Appium dans l'image
COPY . .

# Installation d'Appium + plugin UIAutomator2
RUN apt-get update && \
    apt-get install -y curl unzip && \
    npm install -g appium@2.11.1 && \
    appium driver install uiautomator2

# Expose Appium port
EXPOSE 4723

CMD ["mvn", "test", "-Denv=local"]
