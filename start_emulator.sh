#!/bin/bash

# Exporter les chemins SDK Android
export ANDROID_HOME=C:/Users/KhaledBEDOUI/AppData/Local/Android/Sdk
export PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH

# Démarrer l'émulateur (modifiez le nom selon celui de votre AVD)
emulator -avd "Pixel_6" -no-snapshot-load -no-boot-anim -wipe-data &

# Attendre que l'émulateur soit complètement démarré
echo "Démarrage de l'émulateur..."
adb wait-for-device

# Vérification supplémentaire pour s'assurer que l'émulateur est en ligne
echo "Vérification de l'état de l'émulateur..."
for i in {1..10}; do
    if adb shell getprop sys.boot_completed | grep -m 1 "1"; then
        echo "L'émulateur est complètement prêt."
        break
    else
        echo "L'émulateur n'est pas encore prêt, attente de 10 secondes..."
        sleep 10
    fi
done

adb shell input keyevent 82

# Démarrer Appium
appium &

# Attendre quelques secondes pour s'assurer qu'Appium est démarré
echo "Attendre qu'Appium soit prêt..."
sleep 20  # Attendre 20 secondes

echo "Appium est prêt."
