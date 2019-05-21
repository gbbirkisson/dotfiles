.DEFAULT_GOAL:=all

all: pacman yay dotfiles vim docker remove_cheat_sheet

pacman:
	@sudo pacman -S --needed - < setup/pacman.txt

yay:
	@yaourt -S yay
	@yay -S --needed - < setup/yay.txt

dotfiles:
	./setup/link.sh

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

remove_cheat_sheet:
	mv -f /usr/share/conky/conky1.10_shortcuts_maia /usr/share/conky/conky1.10_shortcuts_maia.old