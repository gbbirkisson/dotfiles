.DEFAULT_GOAL:=help

Q = $(if $(filter 1,$V),,@)
M = $(shell printf "\033[34;1m▶\033[0m")

VENV:=.venv
PYTHON:=$(VENV)/bin/python
ANSIBLE:=ANSIBLE_LOCALHOST_WARNING=False ANSIBLE_INVENTORY_UNPARSED_WARNING=False ANSIBLE_GATHERING=explicit $(PYTHON) -m ansible
PLAYBOOK_PATTERN:=playbooks/*.yml
PLAYBOOKS:=$(wildcard $(PLAYBOOK_PATTERN))

$(VENV): ; $(info $(M) Creating python environment)
	$(Q) python3 -m venv $(VENV) || rm -r $(VENV)
	$(Q) $(PYTHON) -m pip install -q ansible yamllint

.PHONY: lint
lint: $(VENV) ; $(info $(M) Linting playbooks)
	$(Q) $(PYTHON) -m yamllint -s $(PLAYBOOK_PATTERN)

.PHONY: sudo
sudo: ; $(info $(M) Assert sudo)
	$(Q) sudo true

.PHONY: run
run: $(VENV) ; $(info $(M) Running $(PLAYBOOK))
	$(Q) $(ANSIBLE) playbook $(PLAYBOOK) --extra-vars "dotfiles=$(PWD)"

.PHONY: $(PLAYBOOKS)
$(PLAYBOOKS): lint
	$(Q) PLAYBOOK=$@ $(MAKE) --no-print-directory run

.PHONY: install
install: sudo playbooks/install.yml ## Install everything

.PHONY: link
link: $(VENV) ## Link dotfiles to HOME folder
	$(info $(M) Linking dotfiles)
	$(Q) echo ./link
	$(Q) $(MAKE) --no-print-directory playbooks/source.yml

help: ## Show help
	@echo "Makefile targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'
