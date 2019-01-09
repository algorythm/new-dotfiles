#!/bin/bash

# Passing arguments
POSITIONAL=()
while [[ $# -gt 0 ]]; do
    key="$1"
    case $key in
        -c|--clean|--remove)
        bot "Cleaning up dotfiles."
        running "Removing sourcing from rc files"
        clean_rc_files
        ok
        running "Cleaning up linked files"
        clean_link_files
        ok
        bot "Finished! You need to manually restore the .zshrc file if that is wanted."
        exit 0
        shift
        ;;
    esac
done

# Restore positional parameters
set -- "${POSITIONAL[@]}"