#!/bin/sh

mkdir -p ~/githubs/

yaourt -Syu --noconfirm
yaourt -S vim git zsh tmux stow python-pip --noconfirm
sudo pip install virtualenvwrapper
sudo chsh -s /bin/zsh $(whoami)
mkdir -p ~/.local/bin/

#dotfiles
export $DOTIFLES='~/githubs/dotfiles'
git clone https://github.com/Sebohe/dotfiles $DOTFILES

#Alacritty
git clone https://aur.archlinux.org/alacritty-git.git /tmp/alacritty
cd /tmp/alacritty
makepkg -isr --noconfirm
rm ~/.config/alacritty/alacritty.yml
cd $DOTFILES && stow alacritty

#Vim bundle
git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
cp $DOTFILES/vim/.vimrc ~/.vimrc
vim -c :PluginInstall -c :q -c :q
rm ~/.vimrc
cd $DOTFILES && stow vim

#Suckless
yaourt -S dwm --noconfirm
sudo rm /usr/bin/dwm
git clone https://git.suckless.org/dwm ~/.suckless/dwm
rm ~/.suckless/dwm/config.h
cd $DOTFILES && stow suckless && make
sudo ln -s ~/.suckless/dwm/dwm /usr/bin/dwm

cd $DOTFILES && stow *
