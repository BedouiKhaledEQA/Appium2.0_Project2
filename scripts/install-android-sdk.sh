!/bin/bash
#using shebang with -i to enable interactive mode (auto load .bashrc)

set -e #stop immediately if any error happens
ANDROID_HOME=/opt/androidsdk

# Ajouter le répertoire des outils cmdline à votre variable PATH
export PATH=$ANDROID_HOME/cmdline-tools/bin:$PATH

# Install Open SDK
sudo apt update
sudo apt install openjdk-17-jdk -y
sudo update-java-alternatives --set java-17-openjdk-amd64

# Install SDK Manager
# you can find this file at https://developer.android.com/studio/index.html#downloads - section command line only
cd ~ && wget https://dl.google.com/android/repository/sdk-tools-linux-4333796.zip
ANDROID_HOME=/opt/androidsdk
mkdir -p $ANDROID_HOME
sudo apt install unzip -y && unzip sdk-tools-linux-4333796.zip -d $ANDROID_HOME

echo "export ANDROID_HOME=$ANDROID_HOME" >> ~/.bashrc
echo 'export SDK=$ANDROID_HOME' >> ~/.bashrc
echo 'export PATH=$SDK/emulator:$SDK/tools:$SDK/tools/bin:$SDK/platform-tools:$PATH' >> ~/.bashrc
source ~/.bashrc

# Install Android Image version 28
yes | sudo sdkmanager "platform-tools" "platforms;android-30" "emulator"
yes | sudo sdkmanager "system-images;android-30;google_apis;x86_64"
emulator -version

echo "INSTALL ANDROID SDK DONE!"