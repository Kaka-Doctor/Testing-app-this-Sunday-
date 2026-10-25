# ProGuard / R8 rules for App ya majaribio
-keepattributes JavascriptInterface
-keepattributes *Annotation*
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}
-keep class com.google.android.gms.ads.** { *; }
-dontwarn com.google.android.gms.ads.**
