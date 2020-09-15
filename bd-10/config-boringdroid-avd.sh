echo "replace home placeholder with current home directory"
echo $HOME
sed -i "s|BD_HOME_PLACEHOLDER|$HOME|g" boringdroid_10.ini
sed -i "s|BD_HOME_PLACEHOLDER|$HOME|g" boringdroid_10.avd/hardware-qemu.ini
sdkroot=$ANDROID_SDK_ROOT
echo $sdkroot
if [ -z $sdkroot ]
then
	echo "sdk root is empty use default"
	sdkroot=$HOME/Android/Sdk
	echo "default sdk root is $sdkroot"
else
	echo "sdk root is $sdkroot"
fi
echo "replace android sdk placeholder with current ANDROID_SDK_ROOT"
sed -i "s|BD_ANDROID_SDK_PLACEHOLDER|$sdkroot|g" ./boringdroid_10.avd/config.ini
sed -i "s|BD_ANDROID_SDK_PLACEHOLDER|$sdkroot|g" ./boringdroid_10.avd/hardware-qemu.ini
echo "backup origin android-29 default x86_64 system images"
mkdir -p $sdkroot/system-images/android-29/default/x86_64_bak
rm -rf $sdkroot/system-images/android-29/default/x86_64_bak/*
mkdir -p $sdkroot/system-images/android-29/default/x86_64
cp -r $sdkroot/system-images/android-29/default/x86_64/* $sdkroot/system-images/android-29/default/x86_64_bak/
rm -rf $sdkroot/system-images/android-29/default/x86_64/*
echo "copy boringdroid 10 system images to android-29 default x86_64 directory"
cp -r system-images/* $sdkroot/system-images/android-29/default/x86_64/

echo "copy boringdroid-10 avd"
rm -rf $HOME/.android/avd/boringdroid_10.avd
rm -rf $HOME/.android/avd/boringdroid_10.ini
cp -r boringdroid_10.avd $HOME/.android/avd/
cp -r boringdroid_10.ini $HOME/.android/avd/
