#!/bin/sh

layout_poetry() {
	PYPROJECT_TOML="${PYPROJECT_TOML:-pyproject.toml}"
	if [ ! -f "$PYPROJECT_TOML" ]; then
		log_status "No pyproject.toml found. Executing \`poetry init\` to create a \`$PYPROJECT_TOML\` first."
		poetry init -q
		poetry install --no-root
	fi

	if [ -d ".venv" ]; then
		VIRTUAL_ENV="$(pwd)/.venv"
	else
		VIRTUAL_ENV="$(poetry env list --full-path | head -1 | awk '{print $1}')"
	fi

	if [ -z "$VIRTUAL_ENV" ] || [ ! -d "$VIRTUAL_ENV" ]; then
		log_status "No virtual environment exists. Executing \`poetry install\` to create one."
		poetry install
		VIRTUAL_ENV="$(poetry env list --full-path | head -1 | awk '{print $1}')"
	fi

	poetry check --ansi >/dev/null || true

	PATH_add "$VIRTUAL_ENV/bin"
	export POETRY_ACTIVE=1
	export VIRTUAL_ENV
}
