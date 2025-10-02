M = $(shell printf "\033[34;1m▶\033[0m")
Q = $(if $(filter 1,$V),,@)

VENVS:=../../.venv
VENV:=$(VENVS)/themes
CONFIGS:=../../.config
PYTHON_OS:=/usr/bin/python3
PYTHON_VENV:=$(VENV)/bin/python
BUILDER:=$(VENV)/bin/python builder.py

THEME:=schemes/onedark.yaml

all: ghostty fzf regolith swaync

.PHONY: ghostty
ghostty:
	$(Q) mkdir -p $(CONFIGS)/ghostty/themes
	$(Q) IN=templates/ghostty OUT=$(CONFIGS)/ghostty/themes/theme $(MAKE) --no-print-directory _render

.PHONY: swaync
swaync:
	$(Q) IN=templates/swaync.style.css OUT=$(CONFIGS)/swaync/style.css $(MAKE) --no-print-directory _render

.PHONY: fzf
fzf:
	$(Q) IN=templates/fzf.fish OUT=$(CONFIGS)/fish/conf.d/fzf-theme.fish $(MAKE) --no-print-directory _render

.PHONY: regolith
regolith:
	$(Q) IN=templates/regolith OUT=$(CONFIGS)/regolith3/Xresources $(MAKE) --no-print-directory _render

$(VENV):
	$(info $(M) Creating python environment)
	$(Q) mkdir -p $(VENVS)
	$(Q) $(PYTHON_OS) -m venv $(VENV) || rm -r $(VENV)
	$(Q) $(PYTHON_VENV) -m pip install -q pyyaml jinja2

.PHONY: _render
_render: $(VENV)
	$(info $(M) Rendering $(IN) to $(OUT))
	$(Q) $(BUILDER) -t $(IN) -c $(THEME) > $(OUT)
