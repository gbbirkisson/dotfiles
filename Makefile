dotfiles:
	@# Remove i3 config
	rm -rf ${HOME}/.i3

	@# Link config dir
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

remove_cheat_sheet:
	mv -f /usr/share/conky/conky1.10_shortcuts_maia /usr/share/conky/conky1.10_shortcuts_maia.old