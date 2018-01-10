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

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

setxkbmap -option compose:ralt


#ALIASES
alias ls='ls --color=auto'
alias gs='git status'
alias gc='git commit'
alias grep='grep --color=auto'

#PROMPT
NEWLINE=$'\n'
PROMPT="${NEWLINE}%F{red}%n%f@%F{blue}%m%f %F{yellow}%/%f-> "

#DEFAULTS
BROWSER=/usr/bin/firefox
EDITOR=/usr/bin/vim
TERM=/usr/bin/alacritty

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

KEYTIMEOUT=1

bindkey -v
