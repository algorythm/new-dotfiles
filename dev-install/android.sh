#!/bin/bash

os=$(uname)

if [[ "$os" == "Darwin" ]]; then
    echo "Updating brew"
    brew update
    echo "Installing Android Studio for MacOS"
    brew cask install android-Studio
fi
