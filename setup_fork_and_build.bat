@echo off
echo ============================================
echo  MultiPicture Fork and Build Setup
echo ============================================
echo.

echo Step 1: Fork the repository
echo 1. Go to: https://github.com/lllllT/MultiPictureLiveWallpaper
echo 2. Click the "Fork" button
echo 3. Wait for fork to complete
echo.

echo Step 2: Update remote origin
set /p username="Enter your GitHub username: "
echo.

echo Updating git remote to your fork...
git remote remove origin
git remote add origin https://github.com/%username%/MultiPictureLiveWallpaper.git

echo.
echo Step 3: Push to your fork
echo git push -u origin master
git push -u origin master

if errorlevel 1 (
    echo.
    echo ❌ Push failed! Make sure:
    echo 1. You have forked the repository
    echo 2. Your GitHub username is correct
    echo 3. You are logged into git (run: git config --global user.name "Your Name")
    echo.
    echo Manual commands:
    echo git remote add origin https://github.com/%username%/MultiPictureLiveWallpaper.git
    echo git push -u origin master
    echo.
    pause
    exit /b 1
)

echo.
echo ✅ Success! Your code is now in your fork.
echo.
echo Step 4: Check the build
echo 1. Go to: https://github.com/%username%/MultiPictureLiveWallpaper
echo 2. Click on "Actions" tab
echo 3. Watch the build progress
echo 4. Download APK from "Artifacts" when build completes
echo.
echo The APK will be automatically built by GitHub Actions!
echo Look for files like: app-free-debug.apk, app-dnt-debug.apk
echo.
pause