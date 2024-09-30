#!/usr/bin/env bash

layout_poetry() {
    POETRY=$(which poetry)
    if has mise; then
        POETRY=$(mise which poetry)
    fi

    if [ -z "$POETRY" ]; then
        log_error "bin \`poetry\` not found"
        return
    fi

    PYPROJECT_TOML="${PYPROJECT_TOML:-pyproject.toml}"
    if [ ! -f "$PYPROJECT_TOML" ]; then
        log_error "no \`$PYPROJECT_TOML\` found"
        log_status "creating a \`$PYPROJECT_TOML\` with \`poetry\`"
        touch README.md
        $POETRY init -q
        $POETRY install --no-root
    fi

    if [ -d ".venv" ]; then
        VIRTUAL_ENV="$(pwd)/.venv"
    else
        VIRTUAL_ENV="$($POETRY env list --full-path | head -1 | awk '{print $1}')"
    fi

    if [ -z "$VIRTUAL_ENV" ] || [ ! -d "$VIRTUAL_ENV" ]; then
        log_status "creating venv with \`poetry\`"
        $POETRY install
        VIRTUAL_ENV="$($POETRY env list --full-path | head -1 | awk '{print $1}')"
    fi

    if has mise; then
        mise current python | sed 's/ /\n/g' | rg -q "$($POETRY run python -V | rg -o '\d+\.\d+\.\d+')" || {
            log_error "python venv version and .tool-versions does not match"
        }
    fi

    log_status "running poetry check"
    $POETRY check --ansi >/dev/null || true

    PATH_add "$VIRTUAL_ENV/bin"
    export POETRY_ACTIVE=1
    export VIRTUAL_ENV
}
