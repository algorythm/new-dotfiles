#!/bin/bash

# This script sources and links all files

source lib/print.sh

function linkfiles()
{
    # info "Linking files"
    cd lib/link-files
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
    cd lib/source-files
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
    source lib/bash_prompt.sh
fi

if [ -x "$(command -v nvim) "]; then
    update-alternatives --set editor $(which nvim)
else
    update-alternatives --set editor /usr/bin/vim.basic
fi

linkfiles
sourcefiles
