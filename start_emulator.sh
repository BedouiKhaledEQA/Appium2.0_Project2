#!/bin/bash

# Exporter le chemin d'Appium
export PATH="$PATH:C:/Users/KhaledBEDOUI/AppData/Roaming/npm"

# Exporter les chemins du SDK Android
export ANDROID_SDK_ROOT="C:/Users/KhaledBEDOUI/AppData/Local/Android/Sdk"
export PATH="$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/platform-tools:$PATH"

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
