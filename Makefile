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

.PHONY: _run
_run: $(VENV)
	$(info $(M) Running $(PLAYBOOK))
	$(Q) $(ANSIBLE) $(AQ) playbook $(PLAYBOOK) --extra-vars "dotfiles=$(PWD) venvs=$(PWD)/$(VENVS)"

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
update: _sudo  ## Update packages
	$(Q) sudo apt update
	$(Q) sudo apt upgrade -y
	$(Q) sudo snap refresh
	$(Q) rustup update
	$(Q) $(MAKE) --no-print-directory playbooks/base-cargo-bins.yml
	$(Q) $(MAKE) --no-print-directory playbooks/dev-nvim-nvchad.yml

.PHONY: term
term: _sudo ## Set default terminal to alacritty
	$(info $(M) Setting default terminal)
	$(Q) which alacritty
	$(Q) update-alternatives --list x-terminal-emulator | grep -q alacritty || echo sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $(shell which alacritty) 100
	$(Q) # sudo update-alternatives --config x-terminal-emulator

.PHONY: renovate
renovate: ## Tests renovate configuration
	LOG_LEVEL=debug \
	RENOVATE_BASE_BRANCHES=main \
	RENOVATE_CONFIG_FILE=.github/renovate.json5 renovate \
		--token=${GITHUB_TOKEN} \
		--schedule="" \
		--require-config=ignored \
		--dry-run=full \
		gbbirkisson/dotfiles

.PHONY: help
help: ## Show help
	$(info $(M) Makefile targets:)
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'
