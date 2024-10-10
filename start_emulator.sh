#!/bin/bash

echo "Démarrage du script..."

# Export Android SDK paths
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH

echo "Lancement de l'émulateur..."
# Démarrer l'émulateur
emulator -avd "Pixel_6" -no-snapshot-load -no-boot-anim -wipe-data &

echo "Attente que l'émulateur soit prêt..."
adb wait-for-device
adb shell input keyevent 82
echo "L'émulateur est prêt."

# Démarrer Appium
echo "Démarrage d'Appium..."
appium &

# Attendre quelques secondes pour s'assurer qu'Appium est démarré
sleep 10
echo "Appium est prêt."
