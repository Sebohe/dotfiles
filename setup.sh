#!/usr/bin/env bash
mkdir -p ~/.local/bin
mkdir -p ~/.config/{nvim,alacritty,Code/User}
mkdir -p ~/.vim/{autoload,doc,spell}
mkdir -p ~/.vim/{autoload,doc,spell}

git clone https://github.com/ohmyzsh/ohmyzsh ~/.oh-my-zsh


files=".aliases
.config/alacritty/alacritty.yml
.config/Code/User/*
.config/dwm-status.toml
.config/dunstrc
.config/nvim/*
.config/nixpkgs/*
.oh-my-zsh/custom/themes/*
.config/starship.toml
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
.xbindkeysrc
.zshrc
"

for x in $files; do
  ln -sf `pwd`/$x $HOME/$x
done
