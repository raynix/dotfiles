SHELL := /bin/bash

.PHONY: install
install:
	set -e; \
	git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1; \
	sudo dnf install fzf ripgrep; \
	for i in home/.*.bash; do \
		cp -f $$(pwd)/$$i ~/$${i##*/}; \
	done
	cp -f home/.bash_profile ~/
