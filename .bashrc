# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

setxkbmap -option compose:ralt


#ALIASES
alias ls='ls --color=auto'
alias gs='git status'
alias gc='git commit'
alias grep='grep --color=auto'
alias kpd='keybase pgp decrypt'
alias kpe='keybase pgp encrypt'
#alias git='hub'


#PS1
GREEN="\[$(tput setaf 2)\]"
SKY_BLUE="\[$(tput setaf 27)\]"
YELLOW="\[$(tput setaf 220)\]"
RESET="\[$(tput sgr0)\]"
export PS1="\n${SKY_BLUE}\u${YELLOW}\w\n${GREEN}->${RESET}"

#DEFAULTS
BROWSER=/usr/bin/firefox
EDITOR=/usr/bin/vim

#DISABLE crtl+s in terminal
stty ixany
stty ixon -ixoff

#PATH
export PATH=$PATH:/home/sebas/scripts/


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
