.DEFAULT_GOAL:=help
.PHONY: link

RUST_PATH:=~/.cargo/bin

install-all: install-be install-rust install-docker apt-install cargo-install ## Install everything
update-all: apt-update cargo-update ## Update everything

install-be: ## Install build-essential
	### Install build-essential started ###
	sudo apt install build-essential cmake
	### Install build-essential done ###

install-rust: ## Install rust toolchain
	### Install rust toolchain started ###
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
	${RUST_PATH}/rustup default stable
	${RUST_PATH}/rustup update
	### Install rust toolchain done ###

install-docker: ## Install docker
	### Install docker started ###
	sudo mkdir -p /etc/apt/keyrings
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
	echo \
  		"deb [arch=$(shell dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  		$(shell lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
	sudo apt-get update
	sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin
	sudo usermod -a -G docker ${USER}
	### Install docker done ###

install-ngrok:  ## Install ngrok (optional)
	### Install ngrok started ###
	curl -s https://ngrok-agent.s3.amazonaws.com/ngrok.asc | sudo tee /etc/apt/trusted.gpg.d/ngrok.asc >/dev/null
	echo "deb https://ngrok-agent.s3.amazonaws.com buster main" | sudo tee /etc/apt/sources.list.d/ngrok.list
	sudo apt update
	sudo apt install ngrok
	### Install ngrok done ###
	
apt-install: ## Install apt packages
	### Update apt packages started ###
	cat install-apt | sed -e 's%\s*#.*$$%%g' | xargs sudo apt install -y
	### Update apt packages done ###

apt-update: ## Update apt packages
	### Update apt packages started ###
	sudo apt update
	sudo apt upgrade
	### Update apt packages done ###

cargo-install: ## Install cargo packages
	### Install cargo packages started ###
	cat install-cargo | sed -e 's%\s*#.*$$%%g' | xargs ${RUST_PATH}/cargo install
	### Install cargo packages done ###

cargo-update: ## Update cargo packages
	### Update cargo packages started ###
	cat install-cargo | sed -e 's%\s*#.*$$%%g' | xargs ${RUST_PATH}/cargo install-update
	### Update cargo packages done ###

link: ## Link this repo to HOME folder
	### Link this repo to HOME folder started ###
	./link
	### Link this repo to HOME folder done ###

source: ## Source custom dot files
	### Source dotfiles started ###
	echo 'source $$HOME/.bashrc_gbb' >> ${HOME}/.bashrc
	echo 'source $$HOME/.profile_gbb' >> ${HOME}/.profile
	### Source dotfiles done ###

help: ## Show help
	@echo "Makefile targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'
