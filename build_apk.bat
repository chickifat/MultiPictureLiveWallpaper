@echo off
echo ====================================
echo  MultiPicture APK Build Script
echo ====================================
echo.

REM Check if Java is installed
java -version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Java is not installed or not in PATH
    echo Please install Java JDK 11 or later from: https://adoptium.net/
    echo.
    pause
    exit /b 1
)

echo ✓ Java found

REM Check if Android SDK is available
if not exist "%ANDROID_HOME%" (
    if not exist "%ANDROID_SDK_ROOT%" (
        echo ERROR: Android SDK not found
        echo Please install Android Studio or set ANDROID_HOME environment variable
        echo Download from: https://developer.android.com/studio
        echo.
        pause
        exit /b 1
    ) else (
        set ANDROID_HOME=%ANDROID_SDK_ROOT%
    )
)

echo ✓ Android SDK found at %ANDROID_HOME%

REM Create local.properties file
echo sdk.dir=%ANDROID_HOME:\=/% > local.properties
echo ✓ Created local.properties

REM Build the APK
echo.
echo Building APK files...
echo.

REM Try Gradle build first
if exist gradlew.bat (
    echo Using Gradle build...
    call gradlew.bat assembleFreeDebug assembleDntDebug
    if errorlevel 1 (
        echo Gradle build failed, trying alternative method...
        goto ant_build
    )
    
    echo.
    echo ✓ Build completed successfully!
    echo.
    echo APK files created:
    if exist app\build\outputs\apk\free\debug\*.apk (
        dir /b app\build\outputs\apk\free\debug\*.apk
    )
    if exist app\build\outputs\apk\dnt\debug\*.apk (
        dir /b app\build\outputs\apk\dnt\debug\*.apk
    )
    
    echo.
    echo The APK files are ready for installation!
    echo Transfer to your Android device and install.
    echo.
    pause
    exit /b 0
)

:ant_build
echo Using legacy Ant build...

REM Check if Ant is available
ant -version >nul 2>&1
if errorlevel 1 (
    echo ERROR: Apache Ant not found
    echo Please install Ant from: https://ant.apache.org/
    echo Or install Android Studio which includes Gradle
    echo.
    pause
    exit /b 1
)

REM Build with Ant (legacy)
echo Building with Ant...
ant debug

if errorlevel 1 (
    echo Build failed! Please check the error messages above.
    echo.
    echo Possible solutions:
    echo 1. Install Android Studio for complete build environment
    echo 2. Use GitHub Actions to build online
    echo 3. Check BUILD_INSTRUCTIONS.md for more options
    echo.
    pause
    exit /b 1
)

echo.
echo ✓ Build completed successfully!
echo APK file created: bin\MultiPicture-debug.apk
echo.
echo The APK file is ready for installation!
echo Transfer to your Android device and install.
echo.
pause