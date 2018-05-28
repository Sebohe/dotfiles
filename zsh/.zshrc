# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
# End of lines added by compinstall
# ~/.bashrc
#
zstyle :compinstall filename '/home/sebas/.zshrc'
autoload -Uz compinit
compinit

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

bindkey -e

#DEFAULTS
BROWSER=/usr/bin/firefox
EDITOR=/usr/bin/vim
GIT_EDITOR=vim
VISUAL=vim

#DISABLE crtl+s in terminal
stty ixany
stty ixon -ixoff


#PATH
export PATH=$PATH:/home/sebas/.local/bin:$HOME/.gem/ruby/2.5.0/bin

#ALIASES
source $HOME/.aliases

#python virtualenv
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/.Devel
source /usr/bin/virtualenvwrapper.sh

#NIX
source /home/sebas/.nix-profile/etc/profile.d/nix.sh

#GO
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin:/usr/lib/go/bin

#LOCALVARS
source $HOME/.localvars

#STARTX on login
if [ -z $DISPLAY ] && [ -n $XDG_VTNR ] && [ "$XDG_VTNR" -eq 1 ]; then 
	exec startx
fi

#if [[ -z $(pgrep tmux) ]]; then
#    tmux
#fi

#if [[ -n $(pgrep tmux) ]]; then
#   tmux attach
#fi

xinputs_disable.sh
setxkbmap -option compose:ralt
setxkbmap -option ctrl:nocaps
#xinput --set-prop 14 'libinput Accel Speed' 0.45

KEYTIMEOUT=1
bindkey -v
export AWS_CONFIG_FILE=$HOME/.aws/config
export PATH=~/.npm-global/bin:$PATH


# OH MY ZSH
export ZSH=/home/sebas/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="oxide"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git,
  docker
)

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='vim'
fi
