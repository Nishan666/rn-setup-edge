#!/bin/bash

set -e

echo "==> Updating package list..."
sudo apt update

echo "==> Installing dependencies..."
sudo apt install -y curl git openjdk-17-jdk watchman unzip zip

echo "==> Installing Node.js (LTS)..."
curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt install -y nodejs

echo "==> Installing React Native CLI globally..."
sudo npm install -g react-native-cli

echo "==> Installing Android Studio via Snap..."
sudo snap install android-studio --classic

echo "==> Setting up Android SDK environment variables..."

ANDROID_SDK_PATH="$HOME/Android/Sdk"

# Append environment variables if not already present
ENV_FILE="$HOME/.bashrc"
if ! grep -q ANDROID_HOME "$ENV_FILE"; then
  {
    echo ""
    echo "# Android SDK setup for React Native"
    echo "export ANDROID_HOME=$ANDROID_SDK_PATH"
    echo "export PATH=\$PATH:\$ANDROID_HOME/emulator"
    echo "export PATH=\$PATH:\$ANDROID_HOME/tools"
    echo "export PATH=\$PATH:\$ANDROID_HOME/tools/bin"
    echo "export PATH=\$PATH:\$ANDROID_HOME/platform-tools"
  } >> "$ENV_FILE"
fi

# Apply changes
source "$ENV_FILE"

# echo "==> Launching Android Studio for initial setup..."
nohup android-studio > /dev/null 2>&1 & disown

echo "==> All done!"
echo ""
echo "🚀 Android Studio is now launching. Complete the setup wizard to install the Android SDK and emulator."
echo ""
echo "📱 After SDK setup, create a React Native app:"
echo "   \$ npx create-expo-app@latest myapp --template bare-minimum"
echo "   \$ cd myapp"
echo "   \$ npm run android"
echo ""
echo "✅ Setup complete! A reboot is recommended to finalize all changes."
read -p "Would you like to reboot now? (y/N): " -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]; then
    echo "Rebooting..."
    sudo reboot
else
    echo "Please reboot manually when convenient to complete the setup."
fi