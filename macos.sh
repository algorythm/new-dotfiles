#!/bin/bash
CURR_DIR="$(dirname ${BASH_SOURCE})"

source ${CURR_DIR}/print.sh

# Remove all Dock icons
read -p  "Remove all icons from the Dock (Y/n)? " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
    defaults write com.apple.dock persistent-apps -array
fi

bot "Configuring MacOS settings"
source lib/osx-config.sh

bot "Installing Software"
source lib/osx-brew.sh

bot "Configuring Software"
source lib/osx-software-config.sh

bot "Done! Just reboot your Mac for all changes to take effect!"
