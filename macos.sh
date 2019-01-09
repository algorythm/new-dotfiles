#!/bin/bash

source lib/print.sh

bot "This is MacOS System."

if ! questionN "Run MacOS Configuration script?"; then
    echo "nope"
    return -1
fi

# Remove all Dock icons
if questionY "Remove all icons from the Dock"; then
    defaults write com.apple.dock persistent-apps -array
fi

bot "Configuring MacOS settings"
source lib/osx-config.sh

bot "Installing Software"
source lib/osx-brew.sh

bot "Configuring Software"
source lib/osx-software-config.sh

bot "Done! Just reboot your Mac for all changes to take effect!"
