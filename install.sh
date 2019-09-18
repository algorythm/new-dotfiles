#!/usr/bin/env bash
CURR_DIR="$(dirname $0)"

source ${CURR_DIR}/lib/print.sh
source ${CURR_DIR}lib/install.sh

if [ -z $OSTYPE ]; then
    error "OSTYPE is not set. Exiting..."
    exit 1
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
    info "You're running MacOS!"
    read -p "Do you want to setup a new Mac (Y/n)? " -n 1 -r; echo;
    if [[ ! $REPLY =~ ^[Nn]$ ]]; then
        MAC_INSTALL="1"
    fi
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "gnu-linux" || "$OSTYPE" == "cygwin" ]]; then
    info "Your're runing Linux or a Linux like shell"
    read -p "Install software on this machine (y/N)? " -n 1 -r; echo;
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        LINUX_INSTALL="1"
    fi
else
    error "Your shell (${OSTYPE}) is not supported by this script"
    exit 2
fi

if [ ! -z $LINUX_INSTALL ] && [[ "$OSTYPE" != "gnu=linux" ]]; then
    error "Cannot install software when you're not on Linux"
    exit 3
fi

if [[ "${OSTYPE}" == "gnu-linux" ]] || [[ "${OSTYPE}" == "darwin"* ]]; then
    if [[ "$SHELL" == "/bin/bash" ]]; then
        read -p "Install ZSH and oh-my-zsh (Y/n)? " -n 1 -r; echo;
        if [[ ! $REPLY =~ ^[Nn]$ ]]; then
            source ${CURR_DIR}/install_zsh.sh
        fi
    fi
fi

# read -p "Are you sure? (y/N) " -n 1 -r; echo;
# if [[ $REPLY =~ ^[Yy]$ ]]; then
#     echo "Running dangerous stuff"
# fi

# read -p "Do you want to setup a new Mac (Y/n)? " -n 1 -r; echo;
# if [[ ! $REPLY =~ ^[Nn]$ ]]; then
#         echo "Running it"
# fi
