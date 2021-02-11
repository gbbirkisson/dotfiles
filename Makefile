.PHONY: pacman cargo vscode

all: install setup

install: pacman rustup cargo vscode krew

setup: link fonts ssh-agent docker

pacman:
	@cat install/pacman | sed -e 's%\s*#.*$$%%g' | sudo pacman -S --needed -

rustup:
	@rustup default stable
	@rustup update

cargo:
	@cat install/cargo | sed -e 's%\s*#.*$$%%g' | xargs cargo install
	@ln -sf ${HOME}/.cargo/bin/drill ${HOME}/.cargo/bin/drill-rs

vscode:
	@cat install/vscode | sed -e 's%\s*#.*$$%%g' | xargs -L 1 code --force --install-extension

krew:
	@./install/krew

link:
	@./install/link
	
fonts:
	@sudo fc-cache -f -v

ssh-agent:
	@systemctl --user enable --now ssh-agent

docker:
	@sudo systemctl enable --now docker
	@sudo usermod -aG docker ${USER}