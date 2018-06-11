#!/bin/sh

mkdir -p $HOME/githubs/

yaourt -Syu --noconfirm
yaourt -S vim git zsh tmux stow python-pip --noconfirm
sudo pip install virtualenvwrapper
sudo chsh -s /bin/zsh $(whoami)
mkdir -p $HOME/.local/bin/


#dotfiles
export DOTFILES=$HOME'/githubs/dotfiles'
git clone https://github.com/Sebohe/dotfiles $DOTFILES

echo "Dotfiles path: "$DOTFILES

#Alacritty
if [[ -z $(which alacritty) ]]; then
    git clone https://aur.archlinux.org/alacritty-git.git /tmp/alacritty
    cd /tmp/alacritty
    makepkg -isr --noconfirm
    rm -v $HOME/.config/alacritty/alacritty.yml
    cd $DOTFILES && stow alacritty
fi


#Vim bundle
git clone https://github.com/VundleVim/Vundle.vim $HOME/.vim/bundle/Vundle.vim
cp $DOTFILES/vim/.vimrc $HOME/.vimrc
vim -c :PluginInstall -c :q -c :q
rm -v $HOME/.vimrc
cd $DOTFILES && stow vim


#Suckless
yaourt -S dwm --noconfirm
sudo rm /usr/bin/dwm
git clone https://git.suckless.org/dwm $HOME/.suckless/dwm
rm -v $HOME/.suckless/dwm/config.h
cd $DOTFILES && stow suckless
cd $HOME/.suckless/dwm/ && make sudo make install


export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/.Devel
/usr/bin/virtualenvwrapper.sh
rm $HOME/.virtualenvs/postactivate


cd $DOTFILES && stow -t $HOME stow/ && stow *
