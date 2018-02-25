#!/usr/bin/env bash

git clone https://github.com/VundleVim/Vundle.vim $HOME/.vim/bundle/Vundle.vim

# Location of dotfiles
cp $1/vim/.vimrc $HOME/.vimrc
vim -c :PluginInstall -c :q -c :q 
cp $1/vim/.vim/bundle/vim-colorschemes/colors/forgotten-dark.vim .vim/bundle/vim-colorschemes/colors/forgotten-dark.vim
