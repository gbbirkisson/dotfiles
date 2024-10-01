#!/usr/bin/env bash

layout_pip() {
    UV=$(which uv || true)
    if has mise; then
        UV=$(mise which uv || true)
    fi

    if [ -z "$UV" ]; then
        log_error "bin \`uv\` not found"
        return
    fi

    VIRTUAL_ENV="$(pwd)/.venv"
    export VIRTUAL_ENV

    REQ_TXT="${REQ_TXT:-requirements.txt}"
    if [ ! -f "$REQ_TXT" ]; then
        log_error "no \`$REQ_TXT\` found"
        log_status "creating a \`$REQ_TXT\`"
        touch $REQ_TXT
    fi

    if [ ! -d "$VIRTUAL_ENV" ]; then
        log_status "installing python interpreters with \`uv\`"
        $UV python install -q
        log_status "creating venv with \`uv\`"
        $UV venv .venv -q
    fi

    log_status "syncing venv with \`uv\`"
    find . -maxdepth 2 -type f -name 'requirements*.txt' | sort | xargs -L 1 $UV pip install -r
    # $UV pip sync $REQ_TXT

    PATH_add "$VIRTUAL_ENV/bin"
}
