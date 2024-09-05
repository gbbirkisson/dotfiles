M = $(shell printf "\033[34;1m▶\033[0m")
Q = $(if $(filter 1,$V),,@)

VENVS:=../../.venv
VENV:=$(VENVS)/themes
PYTHON_OS:=/usr/bin/python3
PYTHON_VENV:=$(VENV)/bin/python
BUILDER:=$(VENV)/bin/python builder.py

THEME:=schemes/onedark.yaml

all: alacritty k9s tmux fzf regolith

.PHONY: alacritty
alacritty:
	$(Q) IN=templates/alacritty.toml OUT=../alacritty/theme.toml $(MAKE) --no-print-directory _render

.PHONY: k9s
k9s:
	$(Q) IN=templates/k9s.yaml OUT=../k9s/skins/theme.yaml $(MAKE) --no-print-directory _render

.PHONY: tmux
tmux:
	$(Q) IN=templates/tmux.tmux OUT=../tmux/colors.tmux $(MAKE) --no-print-directory _render

.PHONY: fzf
fzf:
	$(Q) IN=templates/fzf.fish OUT=../fish/conf.d/fzf.fish $(MAKE) --no-print-directory _render

.PHONY: regolith
regolith:
	$(Q) IN=templates/regolith OUT=../regolith3/Xresources $(MAKE) --no-print-directory _render

$(VENV):
	$(info $(M) Creating python environment)
	$(Q) mkdir -p $(VENVS)
	$(Q) $(PYTHON_OS) -m venv $(VENV) || rm -r $(VENV)
	$(Q) $(PYTHON_VENV) -m pip install -q pyyaml jinja2

.PHONY: _render
_render: $(VENV)
	$(info $(M) Rendering $(IN) to $(OUT))
	$(Q) $(BUILDER) -t $(IN) -c $(THEME) > $(OUT)
