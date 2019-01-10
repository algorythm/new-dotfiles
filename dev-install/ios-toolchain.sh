#!/bin/bash

os=$(uname)
if [[ ! $os == "Darwin" ]]; then
    echo "Duh, you can only run this on MacOS!"
    exit -1
fi

if [ ! -x "$(command -v brew)" ]; then
    echo "Install brew before running this script."
    exit -1
fi

echo "Updating brew"
brew update

echo "Installing libimobiledevice and ideviceinstaller."
brew install --HEAD usbmuxd
brew link usbmuxd
brew install --HEAD libimobiledevice
brew install ideviceinstaller

echo "Installing ios-deploy"
brew install ios-deploy

echo "Installing CocoaPods"
brew install cocoapods
pod setup

echo "Done!"
