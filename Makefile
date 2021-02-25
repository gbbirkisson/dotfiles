.DEFAULT_GOAL:=help
.PHONY: install setup pacman rustup cargo vscode krew link fonts ssh-agent docker help

all: install setup ## Install, setup and link everything

install: pacman rustup cargo vscode krew ## Install all dependencies

setup: link fonts ssh-agent docker ## Setup and link everything

pacman: # Install pacman packages
	@cat install/pacman | sed -e 's%\s*#.*$$%%g' | sudo pacman -S --needed -

rustup: ## Setup rust
	@rustup default stable
	@rustup update

cargo: ## Install cargo packages
	@cat install/cargo | sed -e 's%\s*#.*$$%%g' | xargs cargo install
	@ln -sf ${HOME}/.cargo/bin/drill ${HOME}/.cargo/bin/drill-rs

vscode: ## Install vscode addons
	@cat install/vscode | sed -e 's%\s*#.*$$%%g' | xargs -L 1 code --force --install-extension

krew: ## Install krew
	@./install/krew

link: ## Link this repo to $HOME folder
	@./install/link
	
fonts: ## Update font cache
	@sudo fc-cache -f -v

ssh-agent: ## Enable systemd ssh-agent service
	@systemctl --user enable --now ssh-agent

docker: ## Enable docker and setup user privileges
	@sudo systemctl enable --now docker
	@sudo usermod -aG docker ${USER}

help: ## Show help
	@echo "Makefile targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2}'