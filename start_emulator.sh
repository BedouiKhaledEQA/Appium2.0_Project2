# Démarrer l'émulateur
emulator -avd "Pixel_6" -no-snapshot-load -no-boot-anim -wipe-data &

# Attendre un temps fixe pour permettre à l'émulateur de démarrer
echo "Attente de 30 secondes pour que l'émulateur démarre..."
sleep 60

# Démarrer Appium
appium &

# Attendre quelques secondes pour s'assurer qu'Appium est démarré
echo "Attente de 20 secondes pour qu'Appium démarre..."
sleep 20
