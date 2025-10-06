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

echo "==> All done!"
echo ""
echo "🚀 Android Studio installed. Now launch it to install the Android SDK and emulator:"
echo "   $ android-studio"
echo ""
echo "📱 After SDK setup, create a React Native app:"
echo "   $ npx create-expo-app@latest "$PROJECT_NAME" --template bare-minimum"
echo "   $ cd $PROJECT_NAME"
echo "   $ npm run android"
echo ""
echo "✅ You may need to reboot or restart your terminal to finalize environment variable setup."