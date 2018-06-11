#!/usr/bin/env bash

url=https://github.com/VundleVim/Vundle.vim
git clone $url $HOME/.vim/bundle/Vundle.vim

# Location of dotfiles
stow vim
vim -c :PluginInstall -c :q -c :q 
stow vim
