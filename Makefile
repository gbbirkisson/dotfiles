.DEFAULT_GOAL:=help

Q = $(if $(filter 1,$V),,@)
M = $(shell printf "\033[34;1m▶\033[0m")

VENV:=.venv
PYTHON:=$(VENV)/bin/python
ANSIBLE:=ANSIBLE_LOCALHOST_WARNING=False ANSIBLE_INVENTORY_UNPARSED_WARNING=False ANSIBLE_GATHERING=explicit $(PYTHON) -m ansible
PLAYBOOKS:=$(wildcard *.yml)

$(VENV): ; $(info $(M) Creating python environment)
	$(Q) python3 -m venv $(VENV) || rm -r $(VENV)
	$(Q) $(PYTHON) -m pip install -q ansible yamllint

.PHONY: lint
lint: $(VENV) ; $(info $(M) Linting playbooks)
	$(Q) $(PYTHON) -m yamllint -s *.yml

.PHONY: sudo
sudo: ; $(info $(M) Make sure we can sudo)
	$(Q) sudo true

.PHONY: run
run: $(VENV) ; $(info $(M) Running playbook '$(PLAYBOOK)')
	$(Q) $(ANSIBLE) playbook $(PLAYBOOK)

.PHONY: $(PLAYBOOKS)
$(PLAYBOOKS): lint
	$(Q) PLAYBOOK=$@ $(MAKE) --no-print-directory run

.PHONY: install
install: sudo install.yml  ## Install everything

help: ## Show help
	@echo "Makefile targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

# TODO: sudo usermod -a -G docker ${USER}

# link: ## Link this repo to HOME folder
# 	### Link this repo to HOME folder started ###
# 	./link
# 	### Link this repo to HOME folder done ###
#
# source: ## Source custom dot files
# 	### Source dotfiles started ###
# 	echo 'source $$HOME/.bashrc_gbb' >> ${HOME}/.bashrc
# 	echo 'source $$HOME/.profile_gbb' >> ${HOME}/.profile
# 	### Source dotfiles done ###
