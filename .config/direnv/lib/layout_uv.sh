#!/usr/bin/env bash

_get_bin() {
    NAME=$1
    BIN=""

    # Try to find it with mise
    if has mise; then
        BIN=$(mise which $NAME 2>/dev/null || true)
    fi

    # Not found yet, try to find it on system
    if ! test -n "$BIN"; then
        BIN=$(which $NAME || true)
    fi

    # If bin found, return it
    if test -n "$BIN"; then
        echo $BIN
    else
        log_error "bin \`$NAME\` not found"
        return 1
    fi
}

_uv_regular() {
    UV=$1
    VIRTUAL_ENV=$2

    PYPROJECT_TOML="${PYPROJECT_TOML:-pyproject.toml}"
    if [ ! -f "$PYPROJECT_TOML" ]; then
        log_error "no \`$PYPROJECT_TOML\` found"
        return 1
    fi

    if [ ! -d "$VIRTUAL_ENV" ]; then
        log_status "installing python interpreters with \`uv\`"
        $UV python install -q
        log_status "creating venv with \`uv\`"
        $UV venv .venv -q
    fi

    log_status "syncing venv with \`uv\`"
    $UV sync
}

_uv_pip() {
    UV=$1
    VIRTUAL_ENV=$2
    REQ_FILES=${@:3}

    if [ ! -d "$VIRTUAL_ENV" ]; then
        log_status "installing python interpreters with \`uv\`"
        $UV python install -q
        log_status "creating venv with \`uv\`"
        $UV venv .venv -q
    fi

    CMD=""
    for req in "${@:3}"; do
        CMD="$CMD -r $req"
    done

    log_status "syncing venv with \`uv\`"
    $UV pip install $CMD
}

layout_uv() {
    UV=$(_get_bin uv)

    VIRTUAL_ENV="${VIRTUAL_ENV:-$(pwd)/.venv}"
    export VIRTUAL_ENV

    REQ_FILES="$@"
    if ! test -n "$REQ_FILES"; then
        _uv_regular $UV $VIRTUAL_ENV
    else
        _uv_pip $UV $VIRTUAL_ENV "$@"
    fi

    PATH_add "$VIRTUAL_ENV/bin"
}
