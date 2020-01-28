SHELL := /bin/bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c

.PHONY: install
.SILENT: install
install:
	# install dependencies
	if [[ ! -e ~/.bash-git-prompt ]]; then
		git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
	fi
	cat <<-EOF |while read command_name package_name; do which $$command_name >/dev/null || sudo dnf install $$package_name; done
	fzf fzf
	rg ripgrep
	EOF
	# copy included source files
	for i in home/.*.bash; do \
		cp -f $$(pwd)/$$i ~/$${i##*/}; \
	done
	# copy the main file with backup
	cp -b home/.bash_profile ~/
	diff ~/.bash_profile ~/.bash_profile~ || echo "Your previous bash_profile has been backed up as ~/.bash_profile~"
	echo "Done!"
