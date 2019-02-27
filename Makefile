.DEFAULT_GOAL:=all

all: pacman yay dotfiles bg _done

pacman:
	@sudo pacman -S --needed - < pacman.txt

yay:
	@yaourt -S yay
	@yay -S --needed - < yay.txt

dotfiles:
	@# Remove i3 config
	rm -rf ${HOME}/.i3

	@# Link config dir
	@mkdir -p ${HOME}/.config
	@mkdir -p ${HOME}/.ssh
	@for file in $(shell find $(CURDIR)/.config -maxdepth 1 \
			-name "*" \
			-not -name ".config"); do \
		f=$$(basename $$file); \
		echo "Link $$file -> ${HOME}/.config/$$f"; \
		rm -rf ${HOME}/.config/$$f; \
		ln -sf $$file ${HOME}/.config/$$f; \
	done

	@# Link ssh dir
	@for file in $(shell find $(CURDIR)/.ssh -maxdepth 1 \
			-name "*" \
			-not -name ".ssh"); do \
		f=$$(basename $$file); \
		echo "Link $$file -> ${HOME}/.ssh/$$f"; \
		rm -rf ${HOME}/.ssh/$$f; \
		ln -sf $$file ${HOME}/.ssh/$$f; \
	done

	@# Link other dot files
	@for file in $(shell find $(CURDIR) -maxdepth 1 \
			-name ".*" \
			-not -name ".gitignore" \
			-not -name ".git" \
			-not -name ".*.swp" \
			-not -name ".ssh" \
			-not -name ".config"); do \
		f=$$(basename $$file); \
		echo "Link $$file -> ${HOME}/$$f"; \
		rm -rf $(HOME)/$$f; \
		ln -sf $$file $(HOME)/$$f; \
	done

services:
	sudo systemctl enable docker
	sudo systemctl start docker
	sudo usermod -aG docker ${USER}
	systemctl --user enable ssh-agent
	systemctl --user start ssh-agent

bg:
	@nitrogen --set-zoom-fill .config/wallpaper.jpg

_done:
	@echo "Logout / Login for changes to take effect"

#vim:
#	rm -rf .vim
#	git clone --recursive https://github.com/jessfraz/.vim.git .vim
#	cd .vim && git submodule update --init
#	rm -rf ${HOME}/.vim
#	rm -rf ${HOME}/.vimrc
#	ln -sf $(shell pwd)/.vim ${HOME}/.vim
#	ln -sf $(shell pwd)/.vim/vimrc ${HOME}/.vimrc

remove_cheat_sheet:
	mv -f /usr/share/conky/conky1.10_shortcuts_maia /usr/share/conky/conky1.10_shortcuts_maia.old
