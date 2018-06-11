DISTRO=$(cat /etc/*-release | grep "^NAME=\"" | awk -F= '{print $2}')
DISTRO=$(echo $DISTRO | sed 's/\"//g')

if [[ $DISTRO == "Ubuntu" ]]
then
    sudo apt install stow git make -y
fi
if [[ $DISTRO == "Arch Linux" ]]
then
    sudo pacman -Sy stow git make --noconfirm
fi

mkdir -p $HOME/.local/bin
