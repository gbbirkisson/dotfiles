.DEFAULT_GOAL:=help

Q = $(if $(filter 1,$V),,@)
AQ = $(if $(filter 1,$V),-vv,)
M = $(shell printf "\033[34;1m▶\033[0m")

VENVS:=.venv
VENV:=$(VENVS)/dotfiles
PYTHON_OS:=/usr/bin/python3
PYTHON_VENV:=$(VENV)/bin/python
ANSIBLE:=ANSIBLE_LOCALHOST_WARNING=False ANSIBLE_INVENTORY_UNPARSED_WARNING=False ANSIBLE_GATHERING=explicit $(PYTHON_VENV) -m ansible
PLAYBOOK_PATTERN:=playbooks/*.yml
PLAYBOOKS:=$(wildcard $(PLAYBOOK_PATTERN))

$(VENV):
	$(info $(M) Creating python environment)
	$(Q) mkdir $(VENVS)
	$(Q) $(PYTHON_OS) -m venv $(VENV) || rm -r $(VENV)
	$(Q) $(PYTHON_VENV) -m pip install -q ansible yamllint

.PHONY:	_sudo
_sudo:
	$(info $(M) Assert sudo)
	$(Q) sudo true

.PHONY:	_apt
_apt:
	$(info $(M) Update apt)
	$(Q) sudo apt update
	$(Q) sudo apt upgrade -y

.PHONY: _run
_run: $(VENV)
	$(info $(M) Running $(PLAYBOOK))
	$(Q) $(ANSIBLE) $(AQ) playbook $(PLAYBOOK) --extra-vars "dotfiles=$(PWD) venvs=$(PWD)/$(VENVS)"
	$(Q) echo "$(M) 🎉 Playbook '$(PLAYBOOK)' finished successfully 🎉"

.PHONY: lint
lint: $(VENV)
	$(info $(M) Linting playbooks)
	$(Q) $(PYTHON_VENV) -m yamllint -s $(PLAYBOOK_PATTERN)

.PHONY: $(PLAYBOOKS)
$(PLAYBOOKS): lint
	$(Q) PLAYBOOK=$@ $(MAKE) --no-print-directory _run

.PHONY: install
install: _sudo playbooks/install.yml ## Install everything

.PHONY: update
update: _sudo _apt _rustup install _tldr _mise _snap _gh_ext ## Update everything
	$(Q) echo "$(M) 🎉 Update finished successfully 🎉"

.PHONY: _mise
_mise:
	$(info $(M) Update mise binaries)
	$(Q) mise install

.PHONY: _rustup
_rustup:
	$(info $(M) Update rustup binaries)
	$(Q) rustup update

.PHONY: _snap
_snap: _sudo
	$(info $(M) Update snap binaries)
	$(Q) sudo snap refresh

.PHONY: _tldr
_tldr:
	$(info $(M) Update tldr cache)
	$(Q) tldr --update

.PHONY: _gh_ext
_gh_ext:
	$(info $(M) Update gh extensions)
	$(Q) gh extensions upgrade --all

.PHONY: theme
theme:  ## Generate theme
	$(Q) $(MAKE) --no-print-directory -C .config/themes all

.PHONY: term
term: _sudo ## Set default terminal
	$(info $(M) Setting default terminal)
	# $(Q) which alacritty
	# $(Q) update-alternatives --list x-terminal-emulator | grep -q alacritty || sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $(shell which alacritty) 100
	$(Q) which ghostty
	$(Q) update-alternatives --list x-terminal-emulator | grep -q ghostty || sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $(shell which ghostty) 101
	$(Q) sudo update-alternatives --config x-terminal-emulator

.PHONY: renovate
renovate: ## Tests renovate configuration
	$(info $(M) Testing renovate configuration)
	$(Q) docker run -it --rm \
		--pull always \
		-u $(shell id -u) \
		-e LOG_LEVEL=debug \
		-e RENOVATE_BASE_BRANCHES=main \
		-e RENOVATE_CONFIG_FILE=.github/renovate.json5 \
		-v .:/project:ro \
		-w /project \
		ghcr.io/renovatebot/renovate \
		renovate \
		--token=${GITHUB_TOKEN} \
		--schedule="" \
		--require-config=ignored \
		--dry-run=full \
		gbbirkisson/dotfiles

.PHONY: help
help: ## Show help
	$(info $(M) Makefile targets:)
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'
