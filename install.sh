#!/usr/bin/env bash
CURR_DIR=$(dirname $0)

source ${CURR_DIR}/lib/print.sh
source ${CURR_DIR}lib/install.sh

bot "This is the ZSH installation script"

if [ -z $OSTYPE ]; then
    error "OSTYPE is not set. Exiting..."
    exit 1
fi

if [[ "$OSTYPE" == "darwin"* ]]; then
    info "You're running MacOS!"
elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "gnu-linux" || "$OSTYPE" == "cygwin" ]]; then
    info "Your're runing Linux or a Linux like shell"
else
    error "Your shell (${OSTYPE}) is not supported by this script"
    exit 2
fi
