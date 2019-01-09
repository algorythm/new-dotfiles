#!/bin/bash

# This script sources and links all files

LIB="./lib"
if [[ $(pwd) == "$HOME" ]]; then LIB="./new-dotfiles/lib"; fi

function linkfiles()
{
    # info "Linking files"
    cd $LIB/link-files
    for file in *; do
        if [ -f ~/.$file ]; then
            # warning "\"$file\" is already linked."
        else
            # info "- $file"
            ln -s $(pwd)/$file $HOME/.$file
        fi
    done
    cd - > /dev/null 2>&1
}

function sourcefiles()
{
    # info "Linking files"
    cd $LIB/source-files
    for file in *; do
        source $file
    done
    cd - > /dev/null 2>&1
}

function addSourcing()
{
    filename=$1
    sourceCommand="source $(pwd)/configure_environment.sh"

    if [ -f $HOME/$filename ]; then
        if ! grep -qF "$sourceCommand" $HOME/$filename; then
            action "Adding automatic sourcing to $HOME/$filename"
            echo $sourceCommand >> $HOME/$filename
        fi
    fi
}

if [[ $SHELL="/bin/bash" ]]; then
    source $LIB/bash_prompt.sh
fi

os="$(uname)"
if [[ $os == "Linux" ]]; then
    if [ -x "$(command -v nvim) " ]; then
        update-alternatives --set editor $(which nvim)
    else
        update-alternatives --set editor /usr/bin/vim.basic
    fi
fi

linkfiles
sourcefiles
