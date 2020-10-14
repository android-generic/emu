#!/bin/bash
#~ set -e

source build/envsetup.sh
lunch ag_x86_64-userdebug
m
echo $ANDROID_PRODUCT_OUT
echo $ANDROID_BUILD_TOP
MYPACKEDIMG=ag-emulator-package

mkdir -p $MYPACKEDIMG
mkdir -p $MYPACKEDIMG/system-images
rm -rf $MYPACKEDIMG/system-images/*
cd $MYPACKEDIMG/system-images
cp $ANDROID_PRODUCT_OUT/system-qemu.img system.img
cp $ANDROID_PRODUCT_OUT/vendor-qemu.img vendor.img
if [ -f $ANDROID_PRODUCT_OUT/ramdisk-qemu.img ]; then
    cp $ANDROID_PRODUCT_OUT/ramdisk-qemu.img ramdisk.img
else
    cp $ANDROID_PRODUCT_OUT/ramdisk.img ramdisk.img
fi;
if [ -f $ANDROID_PRODUCT_OUT/kernel-ranchu-64 ]; then
    cp $ANDROID_PRODUCT_OUT/kernel-ranchu-64 kernel-ranchu-64
else
    cp $ANDROID_PRODUCT_OUT/kernel-ranchu kernel-ranchu
fi;
cp -rf $ANDROID_PRODUCT_OUT/data .
cp -rf $ANDROID_PRODUCT_OUT/advancedFeatures.ini advancedFeatures.ini
cp -rf $ANDROID_PRODUCT_OUT/userdata.img .
cp -rf $ANDROID_PRODUCT_OUT/encryptionkey.img .
cp -rf $ANDROID_PRODUCT_OUT/system/build.prop .
cp -rf $ANDROID_PRODUCT_OUT/VerifiedBootParams.textproto .
cp -rf $ANDROID_BUILD_TOP/vendor/android-generic/utils/emu/ag-11/source.properties .
cd ..
cp -rf $ANDROID_BUILD_TOP/vendor/android-generic/utils/emu/ag-11/README.md .
rm -rf ag-11-system-images.zip
zip -1rq ag-11-system-images.zip system-images README.md
ls -l ag-11-system-images.zip
