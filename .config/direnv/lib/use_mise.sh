#!/usr/bin/env bash

use_mise() {
    if ! has mise; then
        log_error "bin \`mise\` not found"
        return
    fi

    direnv_load mise direnv exec

    IFS=$'\n'
    for l in $(mise current 2>&1 | grep "not installed"); do
        log_error "$l"
    done
    unset IFS
}
