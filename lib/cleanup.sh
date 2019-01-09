#!/bin/bash

function clean_linked_files()
{
    running "Cleaning linked files"

    cd lib/link-files
    for file in *; do
        if [ -L ~/.$file ]; then
            rm $HOME/.$file
        fi
    done

    cd - > /dev/null 2>&1

    ok
}

function clean_rc_files()
{
    string="source $(pwd)/setup.sh"

    if [ -f $HOME/.bashrc ]; then
        grep -v "source $(pwd)/setup.sh" $HOME/.bashrc > bashrc && mv bashrc $HOME/.bashrc
        rm bashrc
    fi

    if [ -f $HOME/.zshrc ]; then
        grep -v "source $(pwd)/setup.sh" $HOME/.zshrc > zshrc && mv zshrc $HOME/.zshrc
        rm zshrc
    fi
}