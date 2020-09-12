# Boringdroid 10 emulator images

It will overwrite `~/Android/Sdk/system-images/android-28/default/x86_64`, so you should back up it before using boringdroid 10 emulator images.

From `~/Android/Sdk` we know it assumes the `ANDROID_SDK_ROOT` is `~/Android/Sdk`, the default sdk directory of Android Studio. And it also assumes `~/.android/avd` is the default avd directory of Android Studio.

We just need run `./config-boringdroid-avd.sh` in current directory to configure boringdroid avd, and it will create an avd instance called `Boringdroid 10`. After that, we can see the `Boringdroid 10` avd instance in Android Studio's `AVD Manager window`. We just need `wipe data` and start it.
