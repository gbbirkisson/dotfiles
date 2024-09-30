#!/usr/bin/env bash

use_mise() {
    direnv_load mise direnv exec
    IFS=$'\n'
    for l in $(mise current 2>&1 | grep "not installed"); do
        log_error "$l"
        install="true"
    done
    unset IFS

    if [ ! -z ${install:+x} ]; then
        log_error "run \`mise install\` to fix issue"
    fi
    unset install
}
