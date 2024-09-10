#!/usr/bin/env bash

use_mise() {
    direnv_load mise direnv exec
    IFS=$'\n'
    for l in $(mise current 2>&1 | grep "not installed"); do
        tput setaf 3
        log_status "$l"
        tput sgr0
    done
    unset IFS
}
