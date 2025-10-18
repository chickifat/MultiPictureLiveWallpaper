# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.

-keepattributes *Annotation*
-keep public class * extends android.app.Activity
-keep public class * extends android.app.Service
-keep public class * extends android.content.BroadcastReceiver
-keep public class * extends android.content.ContentProvider
-keep public class * extends android.preference.PreferenceActivity

# Keep wallpaper service classes
-keep public class * extends android.service.wallpaper.WallpaperService
-keep public class * extends android.service.wallpaper.WallpaperService$Engine

# Keep preference classes
-keep public class * extends android.preference.Preference

# Remove debug logs in release
-assumenosideeffects class android.util.Log {
    public static *** d(...);
    public static *** v(...);
    public static *** i(...);
}