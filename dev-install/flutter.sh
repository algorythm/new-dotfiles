#!/bin/bash
flutterurl="https://storage.googleapis.com/flutter_infra/releases/stable/macos/flutter_macos_v1.0.0-stable.zip"

echo -n "Enter flutter installation folder: "
read folder

if [ ! -d $folder ]; then
    echo "$folder is not a valid folder."
    exit -1
fi

source android.sh

echo "Downloading flutter"

if [ -x "$(command -v curl)" ]; then
    curl $flutterurl -o $folder/flutter.zip
elif [ -x "$(command -v wget)" ]; then
    wget $flutterurl -O $folder/flutter.zip
else
    echo "Install curl or wget to continue installation."
    exit -1
fi

if [ ! -x "$(command -v unzip)" ]; then
    echo "Install unzip to continue installation."
    exit -1
fi

echo "Unzipping flutter.zip"

cd $folder
unzip $folder/flutter.zip
cd -
rm $folder/flutter.zip

if [ -f "$HOME/.zshrc" ]; then 
    echo "export PATH=\$PATH:$folder/flutter/bin" >> $HOME/.zshrc
fi

if [ -f "$HOME/.bashrc" ]; then 
    echo "export PATH=\$PATH:$folder/flutter/bin" >> $HOME/.bashrc
fi

./android-toolchain.sh

os=$(uname)
if [[ "$os" == "Darwin" ]]; then ./ios-toolchain.sh; fi

echo "Done! Restart your terminal session (or source your rc file) to enable the 'flutter' command."
