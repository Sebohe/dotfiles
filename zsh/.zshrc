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

setxkbmap -option compose:ralt


#ALIASES
source $HOME/.aliases
#PROMPT
NEWLINE=$'\n'
PROMPT="${NEWLINE}%F{red}%n%f@%F{blue}%m%f %F{yellow}%/%f${NEWLINE}%F{green}->%f"

#DEFAULTS
BROWSER=/usr/bin/firefox
EDITOR=/usr/bin/vim
GIT_EDITOR=vim

#DISABLE crtl+s in terminal
stty ixany
stty ixon -ixoff

#PATH
export PATH=$PATH:/home/sebas/.local/bin


#python virtualenv
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/.Devel
source /usr/bin/virtualenvwrapper.sh


#STARTX on login
if [ -z $DISPLAY ] && [ -n $XDG_VTNR ] && [ "$XDG_VTNR" -eq 1 ]; then 
	exec startx
fi

cd ~


if [[ -z $(pgrep tmux) ]]; then
    tmux
fi

if [[ -n $(pgrep tmux) ]]; then
   tmux attach
fi

xinputs_disable.sh
#xinput --set-prop 14 'libinput Accel Speed' 0.45

KEYTIMEOUT=1

bindkey -v

workon web3.36
source /home/sebas/.nix-profile/etc/profile.d/nix.sh

export AWS_CONFIG_FILE=$HOME/.aws/config
export PATH=~/.npm-global/bin:$PATH

LS_COLORS='no=00;37:fi=00:di=00;33:ln=04;36:pi=40;33:so=01;35:bd=40;33;01:'
export LS_COLORS
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

