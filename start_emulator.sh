#!/bin/bash

# Export Android SDK paths
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH

# Démarrer l'émulateur avec l'interface graphique
emulator -avd "Pixel_6" -no-snapshot-load -wipe-data &

# Attendre que l'émulateur soit complètement démarré
echo "Démarrage de l'émulateur..."
adb wait-for-device
adb shell input keyevent 82
echo "L'émulateur est prêt."

# Démarrer Appium
appium &

# Attendre quelques secondes pour s'assurer qu'Appium est démarré
sleep 30

echo "Appium est prêt."
