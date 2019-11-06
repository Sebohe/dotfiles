#!/usr/bin/env sh
mkdir -p ~/.local/bin
mkdir -p ~/.config/{nvim,alacritty,Code/User}
mkdir -p ~/.vim/{autoload,doc,spell}


files=".aliases
.config/alacritty/alacritty.yml
.config/Code/User/keybindings.json
.config/Code/User/settings.json
.config/dwm-status.toml
.config/nvim/*
.gitconfig
.local/bin/*
.localvars
.npmrc
.tern-config
.tmux.conf
.vim/autoload/plug.vim
.vim/doc/*
.vim/spell/*
.vimrc
.zshrc
"

for x in $files; do
  ln -sf `pwd`/$x $HOME/$x
done
