#!/bin/bash
CURR_DIR="$(dirname ${BASH_SOURCE})"
source ${CURR_DIR}/print.sh

info "Configuring bash."

source configure_environment.sh
addSourcing .bashrc
