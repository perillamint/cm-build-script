#!/bin/bash
export PATH=$PATH:$(pwd)/bin
export USE_CCACHE=1

set -e

#Firstrun
if [ -d android ]; then
  cd android
else
  mkdir android
  cd android
  repo init -u https://github.com/CyanogenMod/android.git -b cm-12.1
fi

#Fetch files.
repo sync -j4

#Configure stuff.
source build/envsetup.sh
breakfast hammerhead
prebuilts/misc/linux-x86/ccache/ccache -M 50G

#Build begins.
croot
mka bacon
