#!/bin/bash

source lib/print.sh

function install()
{
    if [ -x "$(command -v $1)" ]; then
        warning "$1 is already installed."
        return -1
    fi

    running "Installing $1"

    if [ -x "command -v brew" ]; then
        brew install --quiet $1 && ok || error
    elif [ -x "$(command -v apt)" ]; then
        sudo apt update -qq && ok || error
        sudo apt install -y -qq -o=Dpkg::Use-Pty=0 $1 && ok || error
    elif [ -x "$(command -v apt-get)" ]; then
        sudo apt-get update -qq || error 
        sudo apt-get install -y -qq -o=Dpkg::Use-Pty=0 $1 && ok || error
    else
        error "Cannot install $1 since you don't have brew, apt nor apt-get installed."
    fi
}