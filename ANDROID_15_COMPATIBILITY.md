# MultiPicture Live Wallpaper - Android 15 Compatibility Fix

## Issues Fixed

1. **Updated Target SDK**: Changed from API 11 (Android 3.0) to API 34 (Android 14/15)
2. **Added Modern Permissions**: Added READ_MEDIA_IMAGES for Android 13+ and MANAGE_EXTERNAL_STORAGE for Android 11+
3. **Runtime Permission Handling**: Added proper permission request handling in the settings activity
4. **Scoped Storage Support**: Added requestLegacyExternalStorage flag for Android 10 compatibility
5. **Better Error Handling**: Improved error messages when permissions are missing

## Installation and Setup

### 1. Build the APK
- Build the project using Android Studio or command line tools
- The minimum SDK is now 16 (Android 4.1) and target is 34 (Android 14)

### 2. Install and Grant Permissions
1. Install the APK on your Android 15 device
2. Open the MultiPicture Live Wallpaper app
3. Grant storage permissions when prompted
4. For best compatibility on Android 11+, also grant "All files access" permission:
   - Go to Settings > Apps > MultiPicture > Permissions
   - Enable "All files access" or "Manage all files"

### 3. Configure the Wallpaper
1. Set pictures source (Single picture, Album, or Folder)
2. Select your pictures or folders
3. Apply as live wallpaper

## Troubleshooting

### "Pictures Unavailable" Error
This typically means permissions are not granted:

1. **Check Storage Permission**:
   - Go to Settings > Apps > MultiPicture Live Wallpaper > Permissions
   - Ensure "Photos and videos" or "Storage" is enabled

2. **For Android 11+ (API 30+)**:
   - Also enable "All files access" in the same permissions screen
   - This provides broader access to storage

3. **Restart the Wallpaper**:
   - After granting permissions, restart the live wallpaper
   - Go to Settings > Wallpaper > Live wallpaper > MultiPicture

### No Pictures Showing
1. Verify pictures exist in the selected folder/album
2. Check that the picture format is supported (JPG, PNG)
3. Try selecting a different source (album vs folder)
4. Restart the device if issues persist

## Technical Changes Made

### AndroidManifest.xml Updates
- Updated minSdkVersion from 7 to 16
- Updated targetSdkVersion from 11 to 34
- Added READ_MEDIA_IMAGES permission for Android 13+
- Added MANAGE_EXTERNAL_STORAGE permission for Android 11+
- Added requestLegacyExternalStorage="true" for Android 10 compatibility

### New Permission Helper Class
- Added runtime permission checking and requesting
- Handles different permission requirements for different Android versions
- Provides user-friendly permission flow

### Enhanced Error Handling
- Better SecurityException handling in PictureUtils
- Improved logging for debugging permission issues
- More descriptive error messages

## Compatibility
- ✅ Android 4.1+ (API 16+) - Minimum supported
- ✅ Android 6.0+ (API 23+) - Runtime permissions handled
- ✅ Android 10+ (API 29+) - Scoped storage compatibility
- ✅ Android 11+ (API 30+) - Enhanced storage access
- ✅ Android 13+ (API 33+) - Granular media permissions
- ✅ Android 15 (API 35) - Fully compatible