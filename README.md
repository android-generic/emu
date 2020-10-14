# bdtools

The `agtools` is used to build portable emulator system images, and let user can run ag with emulator in Android Stduio. It also help `BoringdroidSystemUI` developer to develop `BoringdroidSystemUI` without downloading full source code.

## package ag 11

Enter boringdroid source code top directory, and the following belowing code snippet to build and package boringdroid 10:

```
git clone https://github.com/boringdroid/agtools.git
source vendor/android-generic/tools/emu/ag-11/package-ag-11.sh
```

And then the generated zip file will put in `ag-emulator-package` under your source code top directory.
