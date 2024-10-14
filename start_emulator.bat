@echo off

rem Exporter le chemin d'Appium
set PATH=%PATH%;C:\Users\KhaledBEDOUI\AppData\Roaming\npm

rem Exporter les chemins du SDK Android
set ANDROID_HOME=C:\Users\KhaledBEDOUI\AppData\Local\Android\Sdk
set PATH=%ANDROID_HOME%\emulator;%ANDROID_HOME%\platform-tools;%PATH%

rem Démarrer l'émulateur (modifiez le nom selon celui de votre AVD)
echo Démarrage de l'émulateur...
start "" "%ANDROID_HOME%\emulator\emulator" -avd "Pixel_6" -no-snapshot-load -wipe-data

rem Attendre que l'émulateur soit complètement démarré
echo Attente de l'émulateur...
adb wait-for-device
adb shell input keyevent 82
echo "L'émulateur est prêt."

rem Démarrer Appium et afficher les logs dans la console
echo "Démarrage d'Appium..."
start cmd /k appium --log-level info
echo "Appium est prêt."

rem Attendre quelques secondes pour s'assurer qu'Appium est démarré
timeout /t 10
