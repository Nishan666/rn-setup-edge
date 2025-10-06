#!/bin/bash

set -e

# Check if project name is provided
if [ -z "$1" ]; then
    echo "Please provide a project name"
    echo "Usage: ./setup.sh MyAppName"
    exit 1
fi

PROJECT_NAME=$1

# Create Expo project
echo "Creating Expo project..."
npx create-expo-app@latest "$PROJECT_NAME" --template bare-minimum
cd "$PROJECT_NAME"

# Create project structure
echo "Creating project structure..."
mkdir -p src/assets/fonts
mkdir -p src/constants
mkdir -p src/model
mkdir -p src/navigation
mkdir -p src/screens
mkdir -p src/services
mkdir -p src/store/slices
mkdir -p src/styles
mkdir -p src/utils
mkdir -p src/viewmodels

# Install navigation dependencies
echo "Installing navigation dependencies..."
npm install @react-navigation/native @react-navigation/native-stack react-native-gesture-handler react-native-safe-area-context react-native-screens

# Install SVG support
echo "Installing SVG support..."
npm install react-native-svg
npm install --save-dev react-native-svg-transformer