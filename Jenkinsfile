pipeline {
    agent any

    stages {
        stage('Checkout Code') {
            steps {
                // Récupère le code de votre dépôt Git
                checkout scm
            }
        }

        stage('Set Up Environment') {
            steps {
                // Installe les dépendances nécessaires, comme Maven
                sh 'mvn clean install'
            }
        }

        stage('Start Emulator') {
            steps {
                // Démarrer l'émulateur Android
                sh '''
                $ANDROID_HOME/emulator/emulator -avd Pixel_6 -no-snapshot -no-boot-anim -no-window &
                sleep 60  # Attendre que l'émulateur démarre complètement
                '''
            }
        }

        stage('Start Appium') {
            steps {
                // Démarrer Appium en arrière-plan
                sh 'appium --port 4723 --log-level error --log /path/to/logfile &'
                sleep 10  # Attendre qu'Appium soit prêt
            }
        }

        stage('Run Tests') {
            steps {
                // Exécuter les tests
                sh 'mvn test -Denv=local'
            }
        }
    }

    post {
        always {
            // Nettoyer les processus d'émulateur et d'Appium à la fin
            sh 'adb emu kill'  // Stopper l'émulateur
            sh 'pkill -f appium'  // Arrêter le serveur Appium
        }
    }
}
