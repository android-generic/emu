echo "backup origin android-29 default x86_64 system images"
mkdir -p ~/Android/Sdk/system-images/android-29/default/x86_64_bak
rm -rf ~/Android/Sdk/system-images/android-29/default/x86_64_bak/*
mkdir -p ~/Android/Sdk/system-images/android-29/default/x86_64
cp -r ~/Android/Sdk/system-images/android-29/default/x86_64/* ~/Android/Sdk/system-images/android-29/default/x86_64_bak/
rm -rf ~/Android/Sdk/system-images/android-29/default/x86_64/*
echo "copy boringdroid 10 system images to android-29 default x86_64 directory"
cp -r system-images/* ~/Android/Sdk/system-images/android-29/default/x86_64/

echo "copy boringdroid-10 avd"
rm -rf ~/.android/avd/boringdroid_10.avd
rm -rf ~/.android/avd/boringdroid_10.ini
cp -r boringdroid_10.avd ~/.android/avd/
cp -r boringdroid_10.ini ~/.android/avd/
