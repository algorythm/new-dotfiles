#!/bin/bash

if [ ! -x "$(command -v brew)" ]; then
    echo "Install brew before running this script."
    exit -1
fi

echo "Updating brew"
brew update

echo "Installing Android tool"
brew install cask androidtool
echo "Installing Android SDK"
brew install cask android-sdk
echo "Installing Android NDK"
brew install cask android-ndk

echo "Agreeing Android licence info"
android update sdk --no-ui

# export ANDROID_HOME=/usr/local/opt/android-sdk
# export PATH=$ANDROID_HOME/tools:$PATH
# export PATH=$ANDROID_HOME/platform-tools:$PATH
# export PATH=$ANDROID_HOME/build-tools/19.1.0:$PATH
