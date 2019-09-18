#!/bin/bash
CURR_DIR="$(dirname ${BASH_SOURCE})"
source ${CURR_DIR}/lib/print.sh

# Passing arguments
POSITIONAL=()
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        -c|--clean|--remove)
        source ${CURR_DIR}/lib/cleanup.sh
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

os="$(uname)"
if [[ $os == "Darwin" ]]; then
    source macos.sh
fi

# running "> Updating submodule sshkeys"
# git submodule update --quiet --init --remote sshkeys && ok || error

echo;

bot "Configuring shell changes."
info "You're using $SHELL as your default shell."

if [[ $SHELL == "/bin/bash" ]]; then
    # If the user wants to use ZSH and oh-my-zsh etc.
    if questionN "Do you want to replace your default shell with ZSH"; then
        source install_zsh.sh
    else
        source ${CURR_DIR}/lib/configure_bash.sh
    fi
elif [[ $SHELL == "/bin/zsh" ]]; then
    source install_zsh.sh
fi

source ${CURR_DIR}/lib/configure_bash

# running "Adding public keys to authorized_keys file"
# source ${CURR_DIR}/sshkeys/install_keys.sh --username algorythmic --silent && ok || error

