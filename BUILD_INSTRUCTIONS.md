# How to Build MultiPicture Live Wallpaper APK

Since the development environment isn't set up on this system, here are several options to build the APK:

## Option 1: Set Up Local Development Environment

### 1. Install Java Development Kit (JDK)
- Download and install JDK 11 or later from: https://adoptium.net/
- Or use OpenJDK: https://openjdk.java.net/

### 2. Install Android Studio
- Download from: https://developer.android.com/studio
- Follow the installation wizard
- This will install Android SDK, build tools, and Gradle automatically

### 3. Build the APK
```bash
cd "e:\OneDrive\14_Vision\5_Software python\Multipicture\MultiPictureLiveWallpaper"
# If using Android Studio:
./gradlew assembleDebug

# This will create APK files at:
# app/build/outputs/apk/free/debug/app-free-debug.apk
# app/build/outputs/apk/dnt/debug/app-dnt-debug.apk
```

## Option 2: Use GitHub Actions (Recommended)

I've prepared the project with modern Gradle build files. You can use GitHub Actions to build automatically:

### 1. Push to GitHub Repository
```bash
cd "e:\OneDrive\14_Vision\5_Software python\Multipicture\MultiPictureLiveWallpaper"
git add .
git commit -m "Updated for Android 15 compatibility with Gradle build"
git push origin master
```

### 2. Create GitHub Actions Workflow
Create `.github/workflows/build.yml` in your repository:

```yaml
name: Build APK

on:
  push:
    branches: [ master ]
  pull_request:
    branches: [ master ]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
    - uses: actions/checkout@v3
    
    - name: Set up JDK 11
      uses: actions/setup-java@v3
      with:
        java-version: '11'
        distribution: 'temurin'
        
    - name: Cache Gradle packages
      uses: actions/cache@v3
      with:
        path: |
          ~/.gradle/caches
          ~/.gradle/wrapper
        key: ${{ runner.os }}-gradle-${{ hashFiles('**/*.gradle*', '**/gradle-wrapper.properties') }}
        restore-keys: |
          ${{ runner.os }}-gradle-
          
    - name: Grant execute permission for gradlew
      run: chmod +x gradlew
      
    - name: Build debug APK
      run: ./gradlew assembleDebug
      
    - name: Upload APK artifacts
      uses: actions/upload-artifact@v3
      with:
        name: apk-files
        path: app/build/outputs/apk/**/*.apk
```

## Option 3: Online Build Services

### 1. Use GitHub Codespaces
- Open your repository in GitHub Codespaces
- Run the build commands in the cloud environment

### 2. Use Replit or Similar
- Import the project to an online IDE
- Install Android SDK and build

## Option 4: Quick Manual APK Creation (Legacy Method)

For immediate testing, you can try using the old Apache Ant build system:

### 1. Install Apache Ant
- Download from: https://ant.apache.org/
- Add to PATH

### 2. Download Android SDK Command Line Tools
- Get from: https://developer.android.com/studio#command-tools
- Extract and set ANDROID_HOME environment variable

### 3. Build using Ant (Legacy)
```bash
# Create local.properties file
echo "sdk.dir=C:\\path\\to\\android\\sdk" > local.properties

# Build
ant debug
```

## Recommended Approach

**I recommend Option 1 (Android Studio)** for the best experience:

1. Install Android Studio (it's free)
2. Open the project folder
3. Let Android Studio sync and download dependencies
4. Build > Generate Signed Bundle/APK > APK
5. Choose "debug" for testing

## Pre-built APK Files

If you need immediate testing, I can help you:
1. Set up a cloud build environment
2. Use GitHub Actions to automatically build
3. Guide you through Android Studio installation

The modified code is ready to build and should resolve the "Picture is unavailable" issue on Android 15!

## Files Ready for Build

✅ **AndroidManifest.xml** - Updated with modern permissions
✅ **build.gradle** - Modern Android Gradle configuration  
✅ **PermissionHelper.java** - Runtime permission handling
✅ **All variants updated** - Free and DNT versions
✅ **Error handling improved** - Better user feedback

Choose your preferred build method and the APK will be ready for testing!