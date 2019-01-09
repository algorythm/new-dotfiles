#!/bin/bash

source lib/print.sh

# Passing arguments
POSITIONAL=()
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        -c|--clean|--remove)
        source lib/cleanup.sh
        bot "Cleaning up dotfiles."
        running "Removing sourcing from rc files"
        clean_rc_files
        ok
        running "Cleaning up linked files"
        clean_linked_files
        ok
        bot "Finished! You need to manually restore the .zshrc file if that is wanted."
        exit 0
        shift
        ;;
    esac
done

# Restore positional parameters
set -- "${POSITIONAL[@]}"

bot "This is an automated dotfiles setup"

running "> Updating submodule sshkeys"
git submodule update --quiet --init --remote sshkeys && ok || error

echo;

bot "Configuring shell changes."
info "You're using $SHELL as your default shell."

if [[ $SHELL == "/bin/bash" ]]; then
    # If the user wants to use ZSH and oh-my-zsh etc.
    if questionN "Do you want to replace your default shell with ZSH"; then
        source install_zsh.sh
    else
        source lib/configure_bash.sh
    fi
elif [[ $SHELL == "/bin/zsh" ]]; then
    source install_zsh.sh
fi

source lib/configure_bash

running "Adding public keys to authorized_keys file"
source sshkeys/install_keys.sh --username algorythmic --silent && ok || error

os="$(uname)"
if [[ $os == "Darwin" ]]; then
    source macos.sh
fi
