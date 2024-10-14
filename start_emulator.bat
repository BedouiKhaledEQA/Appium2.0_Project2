@echo off

rem Exporter le chemin d'Appium
set PATH=%PATH%;C:\Users\KhaledBEDOUI\AppData\Roaming\npm

rem Exporter les chemins du SDK Android
set ANDROID_SDK_ROOT=C:\Users\KhaledBEDOUI\AppData\Local\Android\Sdk
set PATH=%ANDROID_SDK_ROOT%\emulator;%ANDROID_SDK_ROOT%\platform-tools;%PATH%

rem Démarrer l'émulateur (modifiez le nom selon celui de votre AVD)
echo Démarrage de l'émulateur...
start "" "%ANDROID_SDK_ROOT%\emulator\emulator" -avd "Pixel_6" -no-snapshot-load -wipe-data

rem Attendre que l'émulateur soit complètement démarré
echo Attente de l'émulateur...
adb wait-for-device
adb shell input keyevent 82
echo "L'émulateur est prêt."

rem Vérifier l'état de l'émulateur
for /f %%i in ('adb get-state') do set state=%%i
if "%state%" NEQ "device" (
    echo "Erreur : L'émulateur n'est pas prêt."
    exit /b
)

rem Démarrer Appium et afficher les logs dans la console
echo "Démarrage d'Appium..."
start cmd /k appium --log-level info
echo "Appium est prêt."

rem Attendre que l'utilisateur ferme la fenêtre Appium
echo "Appuyez sur une touche pour quitter..."
pause > nul
