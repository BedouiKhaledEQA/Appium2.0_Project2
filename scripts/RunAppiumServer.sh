#!/bin/bash
set -ex

# Installation du SDK Android (si ce n'est pas déjà fait)
# Assurez-vous que les variables d'environnement ANDROID_HOME et PATH sont correctement configurées
# En supposant que le SDK Android est déjà installé et configuré sur votre système

# Installer Appium et les pilotes Android
npm install -g appium@2.5.1
appium driver install uiautomator2
appium driver install espresso

# Vérifier la version d'Appium installée
appium -v

# Démarrer le serveur Appium en arrière-plan et rediriger les logs vers un fichier
appium --log appium.log &>/dev/null &
