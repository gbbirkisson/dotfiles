#!/usr/bin/env bash

layout_req() {
    REQ_TXT="${REQ_TXT:-requirements.txt}"

    if [ ! -f "$REQ_TXT" ]; then
        log_error "no \`$REQ_TXT\` found"
        return
    fi

    VIRTUAL_ENV="$(pwd)/.venv"
    BIN="$VIRTUAL_ENV/bin"

    if [ -z "$VIRTUAL_ENV" ] || [ ! -d "$VIRTUAL_ENV" ]; then
        log_status "creating venv with \`python -m venv .venv\`"
        python -m venv $VIRTUAL_ENV

        log_status "installing requirements from \`$REQ_TXT\`."
        $BIN/pip install -r $REQ_TXT
    fi

    mise current python | sed 's/ /\n/g' | rg -q "$($BIN/python -V | rg -o '\d+\.\d+\.\d+')" || {
        log_error "python venv version and .tool-versions does not match"
    }

    PATH_add "$BIN"
    export VIRTUAL_ENV
}
