# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#ALIASES
alias ls='ls --color=auto'
alias grep='grep --color=auto'
source .aliases


#PS1
#GREEN="\[$(tput setaf 2)\]"
#SKY_BLUE="\[$(tput setaf 27)\]"
#YELLOW="\[$(tput setaf 220)\]"
#RESET="\[$(tput sgr0)\]"
#export PS1="\n${SKY_BLUE}\u${YELLOW}\w\n${GREEN}->${RESET}"

#DEFAULTS
BROWSER=/usr/bin/firefox
EDITOR=/usr/bin/vim
GIT_EDITOR=$EDITOR

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
    #tmux
    echo
fi

if [[ -n $(pgrep tmux) ]]; then
   # tmux attach
   echo
fi
