#!/bin/bash

os=$(uname)

if [[ "$os" == "Darwin" ]]; then
    echo "Installing Android Studio for MacOS"
    brew cask install android-Studio
fi
