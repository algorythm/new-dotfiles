#!/bin/bash
# Confirm before removing, replacing or overwriting files
alias rm="rm -i"
alias mv="mv -i"
alias cp="cp -i"

alias ll="ls -lh"
alias la="ls -alh"

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias tt="tmux a -t 0 || tmux"
alias per="open -a postman.app"

alias ll="ls -lh"
alias la="ls -alh"

# alias gdd="git diff --color-words --ignore-space-change"
[[ "$(command -v php)" ]] && alias pa="php artisan"
[[ "$(command -v nvim)" ]] && alias vim="nvim"

# alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=/$HOME"
# alias reload="source ~/.zshrc"

# Moved to functions.sh as a function called nfind
# Search for devices with SSH (port 22 is 'open')
# alias n22="nmap -n -Pn 10.20.0.0/24 -p22 -oG - | grep '/open/' | awk '{print \$2}'"

# For Mac:
os="$(uname)"
if [[ $os == "Darwin" ]]; then
    if [ "$(command -v trash)" ]; then
        alias rm="trash"
    fi

    alias wifi="networksetup -getairportnetwork en0"
fi
