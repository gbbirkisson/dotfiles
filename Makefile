.DEFAULT_GOAL:=all

all: pacman yay dotfiles vim docker remove_cheat_sheet

i3:
	@sudo pacman -S --needed - < setup/i3.txt

pacman:
	@sudo pacman -S --needed - < setup/pacman.txt

vscode:
	cat setup/vscode.txt | xargs -L 1 code --install-extension

yay:
	@yaourt -S yay
	@yay -S --needed - < setup/yay.txt

dotfiles:
	#rm ${HOME}/.bash_profile
	./setup/link.sh

fonts:
	sudo fc-cache -f -v

vim:
	git clone --recursive https://github.com/jessfraz/.vim.git vim
	cd vim && git submodule update --init
	rm -rf ${HOME}/.vim
	rm -rf ${HOME}/.vimrc
	ln -sf $(shell pwd)/vim ${HOME}/.vim
	ln -sf $(shell pwd)/vim/vimrc ${HOME}/.vimrc

docker:
	sudo systemctl enable docker
	sudo systemctl start docker
	sudo usermod -aG docker ${USER}