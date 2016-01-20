.PHONY: all dotfiles

all: dotfiles

dotfiles:
	# add aliases for dotfiles
	for file in $(shell find $(CURDIR) -name ".*" -not -name ".gitignore" -not -name ".git" -not -name ".*.swp" -not -name ".terminalrc"); do \
		f=$$(basename $$file); \
		ln -sfn $$file $(HOME)/$$f; \
	done

	ln -sfn $(shell pwd)/.terminalrc $(HOME)/.config/xfce4/terminal/terminalrc
