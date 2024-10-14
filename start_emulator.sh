#!/bin/bash

# Exporter les chemins du SDK Android
export ANDROID_SDK_ROOT="$HOME/Android/Sdk"
export PATH="$ANDROID_SDK_ROOT/emulator:$ANDROID_SDK_ROOT/platform-tools:$PATH"

# Démarrer l'émulateur (modifiez le nom selon celui de votre AVD)
echo "Démarrage de l'émulateur..."
$ANDROID_SDK_ROOT/emulator/emulator -avd "Pixel_6" -no-snapshot-load -wipe-data &

# Attendre que l'émulateur soit complètement démarré
echo "Attente de l'émulateur..."
adb wait-for-device

# Envoyer une touche pour déverrouiller l'émulateur
adb shell input keyevent 82
echo "L'émulateur est prêt."

# Démarrer Appium et afficher les logs dans la console
echo "Démarrage d'Appium..."
appium --log-level info &
echo "Appium est prêt."

# Attendre que l'utilisateur ferme le terminal
echo "Appuyez sur Ctrl+C pour quitter..."
wait
