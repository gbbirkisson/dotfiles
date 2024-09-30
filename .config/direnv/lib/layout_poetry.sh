#!/usr/bin/env bash

layout_poetry() {
    PYPROJECT_TOML="${PYPROJECT_TOML:-pyproject.toml}"
    if [ ! -f "$PYPROJECT_TOML" ]; then
        log_error "no pyproject.toml found"
        log_status "executing \`poetry init\` to create a \`$PYPROJECT_TOML\`"
        poetry init -q
        poetry install --no-root
    fi

    if [ -d ".venv" ]; then
        VIRTUAL_ENV="$(pwd)/.venv"
    else
        VIRTUAL_ENV="$(poetry env list --full-path | head -1 | awk '{print $1}')"
    fi

    if [ -z "$VIRTUAL_ENV" ] || [ ! -d "$VIRTUAL_ENV" ]; then
        log_status "creating venv with \`poetry install\`"
        poetry install
        VIRTUAL_ENV="$(poetry env list --full-path | head -1 | awk '{print $1}')"
    fi

    mise current python | sed 's/ /\n/g' | rg -q "$(poetry run python -V | rg -o '\d+\.\d+\.\d+')" || {
        log_error "python venv version and .tool-versions does not match"
    }

    log_status "running poetry check"
    poetry check --ansi >/dev/null || true

    PATH_add "$VIRTUAL_ENV/bin"
    export POETRY_ACTIVE=1
    export VIRTUAL_ENV
}
