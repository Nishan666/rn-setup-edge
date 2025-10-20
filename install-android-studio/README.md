# React Native Setup Edge

Automated setup script for React Native development environment on Ubuntu/Debian systems.

## What it installs

- **Node.js LTS** - JavaScript runtime
- **React Native CLI** - Command line tools
- **Android Studio** - IDE and Android SDK
- **Java 17 JDK** - Required for Android development
- **Essential tools** - curl, git, watchman, unzip, zip

## Quick Install

```bash
command -v curl >/dev/null 2>&1 || (sudo apt update && sudo apt install -y curl) && curl -fsSL https://raw.githubusercontent.com/Nishan666/rn-setup-edge/master/install-android-studio/install.sh | bash
```

## Manual Install

```bash
git clone https://github.com/Nishan666/rn-setup-edge.git
cd rn-setup-edge/install-android-studio
chmod +x install.sh
./install.sh
```

## Post-Installation

1. **Launch Android Studio**:
   ```bash
   android-studio
   ```

2. **Complete SDK setup** in Android Studio

3. **Create your first React Native app**:
   ```bash
   npx create-expo-app@latest MyApp --template bare-minimum
   cd MyApp
   npm run android
   ```

## Requirements

- Ubuntu/Debian-based Linux distribution
- Internet connection
- sudo privileges

## Environment Variables

The script automatically configures:
- `ANDROID_HOME`
- Android SDK tools in `PATH`

Restart your terminal or reboot to ensure all environment variables are loaded.