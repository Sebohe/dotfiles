
server_links=vim tmux zsh stow git bash
local_links='alacritty bin inputrc xfce4 xinit suckless '$(server_links)

.PHONY: all server local

all: init server local

init:
	$(shell sed -i 's/replace_me/\$HOME/' stow/.stowrc)
	sudo apt install stow
	touch build/init

server: init
	stow $(server_links)
	bash ohmyzsh/oh-my-zsh.sh

local: init

clean:
	rm -r build
