#!/bin/bash

# Export Android SDK paths
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH

# Démarrer l'émulateur (modifiez le nom selon celui de votre AVD)
emulator -avd "Pixel_6" -no-snapshot-load -no-boot-anim -wipe-data &

# Attendre que l'émulateur soit complètement démarré
echo "Démarrage de l'émulateur..."
adb wait-for-device

# Vous pouvez ajouter une vérification supplémentaire pour vous assurer que l'émulateur est prêt
# Vérifier que le démarrage est complet
adb shell getprop sys.boot_completed | grep -m 1 '1'
if [ $? -eq 0 ]; then
    echo "L'émulateur est prêt."
else
    echo "L'émulateur n'a pas démarré correctement."
    exit 1
fi

# Démarrer Appium (assurez-vous que Appium est installé globalement ou spécifiez le chemin)
appium &

# Attendre quelques secondes pour s'assurer qu'Appium est démarré
sleep 10

echo "Appium est prêt."
