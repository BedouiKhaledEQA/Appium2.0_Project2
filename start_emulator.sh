#!/bin/bash

# Export Android SDK paths
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH

# Démarrer l'émulateur (modifiez le nom selon celui de votre AVD)
echo "Démarrage de l'émulateur..."
emulator -avd "Pixel_6" -no-snapshot-load -no-boot-anim -wipe-data &

# Attendre que l'émulateur soit complètement démarré
echo "Attendre que l'émulateur se connecte..."
adb wait-for-device

# Vérifier si l'émulateur est prêt
if adb shell getprop sys.boot_completed | grep -m 1 '1'; then
    echo "L'émulateur est prêt."
else
    echo "L'émulateur n'a pas démarré correctement."
    exit 1
fi

# Démarrer Appium
echo "Démarrage d'Appium..."
appium &

# Attendre que Appium soit opérationnel
sleep 10

# Vérifier si Appium est en cours d'exécution
if ps aux | grep -q "[a]ppium"; then
    echo "Appium est prêt."
else
    echo "Appium n'a pas démarré correctement."
    exit 1
fi
