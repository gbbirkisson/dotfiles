.PHONY: all dotfiles

all: dotfiles

dotfiles:
	# add aliases for dotfiles
	for file in $(shell find $(CURDIR) -name ".*" -not -name ".gitignore" -not -name ".git" -not -name ".*.swp" -not -name ".terminalrc"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done

	mkdir -p $(HOME)/.config/xfce4/terminal/
	ln -sf $(shell pwd)/.terminalrc $(HOME)/.config/xfce4/terminal/terminalrc
	ln -sf $(shell pwd)/submodules/vim/vimrc $(HOME)/.vimrc
