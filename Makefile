
server_links='vim tmux zsh stow git bash'
local_links='alacritty bin inputrc xfce4 xinit suckless '$(server_links)

.PHONY: all

all: init server local

init:
	$(shell sed -i 's/replace_me/\$HOME/' stow/.stowrc)
	bash ops/init.sh

server: init
	stow $(server_links)

local: init
