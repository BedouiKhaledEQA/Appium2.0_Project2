# Utiliser l'image de base appropriée
FROM budtmo/docker-android:emulator_11.0

# Passer à l'utilisateur root
USER root

# Installer Maven et d'autres dépendances nécessaires
RUN apt-get update && \
    apt-get install -y maven curl git && \
    rm -rf /var/lib/apt/lists/*

# Copier le fichier APK dans le conteneur
COPY src/main/resources/ApiDemos-debug.apk /app/ApiDemos-debug.apk

# Copier les fichiers source et le fichier pom.xml
COPY src /app/src
COPY pom.xml /app/pom.xml

# Exposer les ports nécessaires
EXPOSE 6080 4723 5554 5555 4444

# Définir les variables d'environnement
ENV DEVICE="Samsung Galaxy S6" \
    APPIUM=true \
    CONNECT_TO_GRID=true \
    APPIUM_HOST="127.0.0.1" \
    APPIUM_PORT=4723 \
    SELENIUM_HOST="172.17.0.1" \
    SELENIUM_PORT=4444 \
    MOBILE_WEB_TEST=true

# Installer Appium globalement
RUN npm install -g appium

# Installer le fichier APK sur l'émulateur et démarrer Appium
CMD ["bash", "-c", "adb start-server && adb install /app/ApiDemos-debug.apk && appium"]
