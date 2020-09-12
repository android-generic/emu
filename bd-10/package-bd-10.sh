#!/bin/bash

source build/envsetup.sh
lunch boringdroid_x86_64-userdebug
m
echo $ANDROID_PRODUCT_OUT
echo $ANDROID_BUILD_TOP
MYPACKEDIMG=bd-emulator-package

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
cp -rf $ANDROID_BUILD_TOP/bdtools/bd-10/source.properties .
cd ..
rm -rf boringdroid_10.ini
rm -rf boringdroid_10.avd/*
cp -rf $ANDROID_BUILD_TOP/bdtools/bd-10/boringdroid_10.ini .
cp -rf $ANDROID_BUILD_TOP/bdtools/bd-10/boringdroid_10.avd .
cp -rf $ANDROID_BUILD_TOP/bdtools/bd-10/config-boringdroid-avd.sh .
cp -rf $ANDROID_BUILD_TOP/bdtools/bd-10/README.md .
rm -rf boringdroid-10-system-images.zip
zip -1rq boringdroid-10-system-images.zip system-images boringdroid_10.ini boringdroid_10.avd config-boringdroid-avd.sh README.md
ls -l boringdroid-10-system-images.zip
