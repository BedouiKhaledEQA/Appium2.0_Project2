#!/bin/bash

# Export Android SDK paths
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH

# Démarrer l'émulateur (modifiez le nom selon celui de votre AVD)
emulator -avd "Pixel_6" -no-snapshot-load -wipe-data &

# Attendre que l'émulateur soit complètement démarré
echo "Démarrage de l'émulateur..."
adb wait-for-device
adb shell input keyevent 82
echo "L'émulateur est prêt."

# Démarrer Appium et afficher les logs dans la console
echo "Démarrage d'Appium..."
appium --log-level info  # Modifiez le niveau de log si nécessaire
echo "Appium est prêt."

# Attendre quelques secondes pour s'assurer qu'Appium est démarré
sleep 10
