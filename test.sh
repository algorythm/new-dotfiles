#!/bin/bash
wd=$(pwd)
if [[ $(pwd) == $HOME ]]; then
    echo "You are in home"
else
    echo "You're not in home"
fi
