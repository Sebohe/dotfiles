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
source .aliases
#PROMPT
NEWLINE=$'\n'
PROMPT="${NEWLINE}%F{red}%n%f@%F{blue}%m%f %F{yellow}%/%f-> "

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
xinput --set-prop 14 'libinput Accel Speed' 0.45

KEYTIMEOUT=1

bindkey -v
