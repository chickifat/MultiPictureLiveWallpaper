# 🌐 Online APK Builder - No Local Setup Required

## Method 1: Gitpod (FREE - Best Option)
1. Go to: https://gitpod.io
2. Sign in with GitHub
3. Open: https://gitpod.io/#https://github.com/lllllT/MultiPictureLiveWallpaper
4. Wait for workspace to load
5. In the terminal, run:
```bash
# Install Java and Android SDK
sudo apt-get update
sudo apt-get install -y openjdk-17-jdk wget unzip

# Set up Android SDK
export ANDROID_SDK_ROOT=$HOME/android-sdk
mkdir -p $ANDROID_SDK_ROOT/cmdline-tools
cd $ANDROID_SDK_ROOT/cmdline-tools
wget https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip
unzip commandlinetools-linux-9477386_latest.zip
mv cmdline-tools latest

# Set PATH
export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools

# Accept licenses
yes | sdkmanager --licenses
sdkmanager "platforms;android-34" "build-tools;34.0.0"

# Build APK
cd /workspace/MultiPictureLiveWallpaper
chmod +x gradlew
./gradlew assembleFreeDebug
```

6. Download APK from: `app/build/outputs/apk/free/debug/`

## Method 2: Replit
1. Go to: https://replit.com
2. Create new Repl → Import from GitHub
3. Use: https://github.com/lllllT/MultiPictureLiveWallpaper
4. Follow similar commands as above

## Method 3: GitHub Codespaces  
1. Go to your forked repository
2. Click "Code" → "Codespaces" → "Create codespace"
3. Use the same commands as Gitpod

## Ready-to-Copy Commands:
```bash
# Complete build script for online IDEs
sudo apt-get update && sudo apt-get install -y openjdk-17-jdk wget unzip
export ANDROID_SDK_ROOT=$HOME/android-sdk
mkdir -p $ANDROID_SDK_ROOT/cmdline-tools && cd $ANDROID_SDK_ROOT/cmdline-tools
wget -q https://dl.google.com/android/repository/commandlinetools-linux-9477386_latest.zip
unzip -q commandlinetools-linux-9477386_latest.zip && mv cmdline-tools latest
export PATH=$PATH:$ANDROID_SDK_ROOT/cmdline-tools/latest/bin:$ANDROID_SDK_ROOT/platform-tools
yes | sdkmanager --licenses >/dev/null 2>&1
sdkmanager "platforms;android-34" "build-tools;34.0.0" >/dev/null
cd /workspace/MultiPictureLiveWallpaper || cd $HOME/MultiPictureLiveWallpaper
chmod +x gradlew && ./gradlew assembleFreeDebug
echo "✅ APK built! Check: app/build/outputs/apk/free/debug/"
```

Choose any method - all will give you a working APK!