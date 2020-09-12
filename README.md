# bdtools

The `bdtools` is used to build portable emulator system images, and let user can run boringdroid with emulator in Android Stduio. It also help `BoringdroidSystemUI` developer to develop `BoringdroidSystemUI` without downloading full source code.

## package boringdroid 10

Enter boringdroid source code top directory, and the following belowing code snippet to build and package boringdroid 10:

```
git clone https://github.com/boringdroid/bdtools.git
source bdtools/bd-10/package-bd-10.sh
```

And then the generated zip file will put in `bd-emulator-package` under boringdroid source code top directory.
