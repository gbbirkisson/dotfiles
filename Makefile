.DEFAULT_GOAL:=help
.PHONY: install setup mirrors pacman snapd snap rustup cargo vscode krew link fonts ssh-agent docker help

all: install setup ## Install, setup and link everything

install: pacman snapd snap rustup cargo vscode krew ## Install all dependencies

setup: link fonts ssh-agent docker ## Setup and link everything

mirrors: ## Set pacman mirrors
	### Set pacman mirrors started ###
	@sudo pacman-mirrors --country Norway,Sweden,Denmark
	### Set pacman mirrors done ###

pacman: ## Install pacman packages
	### Install pacman packages started ###
	@cat install/pacman | sed -e 's%\s*#.*$$%%g' | sudo pacman -S --needed -
	### Install pacman packages done ###

snapd: ## Enable systemd snapd socket
	### Enable systemd snapd socket started ###
	@sudo systemctl enable --now snapd.socket
	@sudo ln -sf /var/lib/snapd/snap /snap
	### Enable systemd snapd socket done ###

snap: ## Install snap packages
	### Install snap packages started ###
	@cat install/snap | sed -e 's%\s*#.*$$%%g' | xargs -L 1 sudo snap install
	@cat install/snap-classic | sed -e 's%\s*#.*$$%%g' | xargs -L 1 sudo snap install --classic
	### Install snap packages done ###

rustup: ## Setup rust
	### Setup rust started ###
	@rustup default stable
	@rustup update
	### Setup rust done ###

cargo: ## Install cargo packages
	### Install cargo packages started ###
	@cat install/cargo | sed -e 's%\s*#.*$$%%g' | xargs cargo install
	@ln -sf ${HOME}/.cargo/bin/drill ${HOME}/.cargo/bin/drill-rs
	### Install cargo packages done ###

vscode: ## Install vscode addons
	### Install vscode addons started ###
	@cat install/vscode | sed -e 's%\s*#.*$$%%g' | xargs -L 1 code --force --install-extension
	### Install vscode addons done ###

krew: ## Install krew and kubectl addons
	### Install krew and kubectl addons started ###
	@./install/krew
	### Install krew and kubectl addons done ###

link: ## Link this repo to HOME folder
	### Link this repo to HOME folder started ###
	@./install/link
	### Link this repo to HOME folder done ###
	
fonts: ## Update font cache
	### Update font cache started ###
	@sudo fc-cache -f -v
	### Update font cache done ###

ssh-agent: ## Enable systemd ssh-agent service
	### Enable systemd ssh-agent service started ###
	@systemctl --user enable --now ssh-agent
	### Enable systemd ssh-agent service done ###

docker: ## Enable docker and setup user privileges
	### Enable docker and setup user privileges started ###
	@sudo systemctl enable --now docker
	@sudo usermod -aG docker ${USER}
	### Enable docker and setup user privileges done ###

help: ## Show help
	@echo "Makefile targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2}'