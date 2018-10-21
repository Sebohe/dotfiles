
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# XDG
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CACHE_HOME="$HOME/.cache"
if [ ! -w ${XDG_RUNTIME_DIR:="/run/user/$UID"} ]; then
    echo "\$XDG_RUNTIME_DIR ($XDG_RUNTIME_DIR) not writable. Setting to /tmp." >&2
    XDG_RUNTIME_DIR=/tmp
fi
export XDG_RUNTIME_DIR


HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
unsetopt beep

zstyle :compinstall filename '/home/'$HOME'/.zshrc'
autoload -Uz compinit
compinit


#DEFAULTS
BROWSER=/usr/bin/firefox
EDITOR=/usr/bin/vim
GIT_EDITOR=vim
VISUAL=vim

#DISABLE crtl+s in terminal
stty ixany
stty ixon -ixoff

#GO
export GOPATH=$HOME/.go

#PATH
export PATH=$PATH:$GOPATH/bin:/usr/lib/go/bin
export PATH=$PATH:$HOME/.local/bin:$HOME/.gem/ruby/2.5.0/bin:$HOME/.npm-global/bin:$HOME/.cargo/bin

#ALIASES
source $HOME/.aliases

#LOCALVARS
if [ ! -f $HOME/.localvars ]
then
    touch $HOME/.localvar
fi

source $HOME/.nix-profile/etc/profile.d/nix.sh
source $HOME/.localvars
source $HOME/.tiny_care
  

if [[ `hostname` == "ultron" ]]
then
    xinputs_disable.sh
    setxkbmap -option compose:ralt
    setxkbmap -option ctrl:nocaps
fi

# https://raw.githubusercontent.com/Parth/dotfiles/master/zsh/zshrc.sh
# Custom cd
c() {
		cd $1;
		ls;
}

# OH MY ZSH
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="oxide"

# Add wisely, as too many plugins slow down shell startup.
plugins=(git ssh-agent docker taskwarrior history-substring-search zsh-syntax-highlighting git-open)

# I like it being super strict when it comes to paths
CASE_SENSITIVE="true"


# THIS NEEDS TO BE AT THE BOTTOM
source $ZSH/oh-my-zsh.sh

# Vi mode in zsh
bindkey -v
KEYTIMEOUT=1

source $HOME/.z.sh

if [ -z $DISPLAY ] && [ -n $XDG_VTNR ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi
