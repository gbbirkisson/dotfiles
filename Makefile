.DEFAULT_GOAL:=help

Q = $(if $(filter 1,$V),,@)
M = $(shell printf "\033[34;1m▶\033[0m")

VENV:=.venv
PYTHON_OS:=/usr/bin/python3
PYTHON_VENV:=$(VENV)/bin/python
ANSIBLE:=ANSIBLE_LOCALHOST_WARNING=False ANSIBLE_INVENTORY_UNPARSED_WARNING=False ANSIBLE_GATHERING=explicit $(PYTHON_VENV) -m ansible
PLAYBOOK_PATTERN:=playbooks/*.yml
PLAYBOOKS:=$(wildcard $(PLAYBOOK_PATTERN))

$(VENV):
	$(info $(M) Creating python environment)
	$(Q) $(PYTHON_OS) -m venv $(VENV) || rm -r $(VENV)
	$(Q) $(PYTHON_VENV) -m pip install -q ansible yamllint

.PHONY:	_sudo
_sudo:
	$(info $(M) Assert sudo)
	$(Q) sudo true

.PHONY: _run
_run: $(VENV)
	$(info $(M) Running $(PLAYBOOK))
	$(Q) $(ANSIBLE) playbook $(PLAYBOOK) --extra-vars "dotfiles=$(PWD)"

.PHONY: lint
lint: $(VENV)
	$(info $(M) Linting playbooks)
	$(Q) $(PYTHON_VENV) -m yamllint -s $(PLAYBOOK_PATTERN)

.PHONY: $(PLAYBOOKS)
$(PLAYBOOKS): lint
	$(Q) PLAYBOOK=$@ $(MAKE) --no-print-directory _run

.PHONY: all
all: install link ## Do everything

.PHONY: install
install: _sudo playbooks/install.yml ## Install packages

.PHONY: term
term: _sudo ## Set default terminal
	$(info $(M) Setting default terminal)
	$(Q) update-alternatives --list x-terminal-emulator | grep -q $(shell which alacritty) || sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator $(shell which alacritty) 100
	$(Q) # sudo update-alternatives --config x-terminal-emulator

.PHONY: link
link: ## Link dotfiles to HOME folder
	$(info $(M) Linking dotfiles)
	$(Q) echo ./link
	$(Q) $(MAKE) --no-print-directory playbooks/source.yml

help: ## Show help
	$(info $(M) Makefile targets:)
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'
