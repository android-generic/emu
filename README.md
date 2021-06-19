# AG-EMU 
The `agemu` is used to build portable emulator system images, and let user can run ag with emulator in Android Studio.

## package ag 11

Enter source code top directory, and the following belowing code snippet to build and package the emu image:

```
git clone https://github.com/android-generic/emu
source vendor/android-generic/tools/emu/ag-11/package-ag-11.sh
```

Or if you are using Android-Generic in your AOSP based project, you can build the emulator by using:

```
create-emulator-image
```

And then the generated zip file will put in `ag-emulator-package` under your source code top directory.
