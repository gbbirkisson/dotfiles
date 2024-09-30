#!/usr/bin/env bash

layout_uv() {
    UV=$(which uv)
    if has mise; then
        UV=$(mise which uv)
    fi

    if [ -z "$UV" ]; then
        log_error "bin \`uv\` not found"
        return
    fi

    VIRTUAL_ENV="$(pwd)/.venv"
    export VIRTUAL_ENV

    PYPROJECT_TOML="${PYPROJECT_TOML:-pyproject.toml}"
    if [ ! -f "$PYPROJECT_TOML" ]; then
        log_error "no \`$PYPROJECT_TOML\` found"
        log_status "creating a \`$PYPROJECT_TOML\` with \`uv\`"
        $UV init
    fi

    if [ ! -d "$VIRTUAL_ENV" ]; then
        log_status "installing python interpreters with \`uv\`"
        $UV python install -q
        log_status "creating venv with \`uv\`"
        $UV venv .venv -q
        log_status "syncing venv with \`uv\`"
        $UV sync -q
    fi

    PATH_add "$VIRTUAL_ENV/bin"
}
