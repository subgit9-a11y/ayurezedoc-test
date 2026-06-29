# =============================================
# Proguard rules for Ayureze Doctor App
# =============================================

# --- Flutter Engine ---
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.** { *; }
-keep class io.flutter.util.** { *; }
-keep class io.flutter.view.** { *; }
-keep class io.flutter.** { *; }
-keep class io.flutter.plugins.** { *; }
-keep class io.flutter.embedding.** { *; }

# --- Firebase ---
-keep class com.google.firebase.** { *; }
-dontwarn com.google.firebase.**
-keep class com.google.android.gms.** { *; }
-dontwarn com.google.android.gms.**

# --- Google Sign-In / Play Services ---
-keep class com.google.android.gms.auth.** { *; }
-keep class com.google.android.gms.common.** { *; }
-dontwarn com.google.android.gms.auth.**

# --- Razorpay ---
-keep class com.razorpay.** { *; }
-dontwarn com.razorpay.**
-keep class proguard.** { *; }
-dontwarn proguard.**

# --- Agora ---
-keep class io.agora.** { *; }
-dontwarn io.agora.**

# --- OkHttp / Supabase networking ---
-keep class okhttp3.** { *; }
-dontwarn okhttp3.**
-keep class okio.** { *; }
-dontwarn okio.**
-keep class retrofit2.** { *; }
-dontwarn retrofit2.**

# --- OneSignal ---
-keep class com.onesignal.** { *; }
-dontwarn com.onesignal.**

# --- AndroidX ---
-keep class androidx.** { *; }
-dontwarn androidx.**

# --- Reflection / Annotations ---
-keepattributes Signature
-keepattributes *Annotation*
-keepattributes EnclosingMethod
-keepattributes InnerClasses
-keepattributes Exceptions
-keepattributes RuntimeVisibleAnnotations
-keepattributes RuntimeVisibleParameterAnnotations

# --- Kotlin ---
-keep class kotlin.** { *; }
-keep class kotlin.Metadata { *; }
-dontwarn kotlin.**
-keepclassmembers class **$WhenMappings {
    <fields>;
}
