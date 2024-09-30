#!/usr/bin/env bash

layout_pip() {
    PYTHON=$(which python || true)
    if has mise; then
        PYTHON=$(mise which python || true)
    fi

    if [ -z "$PYTHON" ]; then
        log_error "bin \`python\` not found"
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

    BIN="$VIRTUAL_ENV/bin"

    if [ ! -d "$VIRTUAL_ENV" ]; then
        log_status "creating venv with \`python\`"
        $PYTHON -m venv $VIRTUAL_ENV

        log_status "installing requirements from \`$REQ_TXT\`"
        $BIN/pip install -r $REQ_TXT
    fi

    if has mise; then
        mise current python | sed 's/ /\n/g' | rg -q "$($BIN/python -V | rg -o '\d+\.\d+\.\d+')" || {
            log_error "python venv version and .tool-versions does not match"
        }
    fi

    PATH_add "$BIN"
}
