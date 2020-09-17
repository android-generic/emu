# Boringdroid 10 emulator images

It will overwrite `~/Android/Sdk/system-images/android-28/default/x86_64`, so you should back up it before using boringdroid 10 emulator images.

From `~/Android/Sdk` we know it assumes the `ANDROID_SDK_ROOT` is `~/Android/Sdk`, the default sdk directory of Android Studio.

We should create an avd instance from Android Studio with tablet template, such as pixel c, and pure android-29 system images (not any google play api version).
And then, we should use files in `system-images` to replace same name files in `$ANDROID_SDK_ROOT/system-images/android-29/default/x86_64`. After that,
we just need wipe avd data and restart it. To get better experience, we can use `landscape` for avd instance, and open `auto-rotate orientation` in settings.
