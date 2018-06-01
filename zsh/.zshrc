HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
unsetopt beep

zstyle :compinstall filename '/home/sebas/.zshrc'
autoload -Uz compinit
compinit


# If not running interactively, don't do anything
[[ $- != *i* ]] && return

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
export PATH=$PATH:$HOME/.local/bin:$HOME/.gem/ruby/2.5.0/bin:$HOME/.npm-global/bin

#ALIASES
source $HOME/.aliases

#LOCALVARS
source $HOME/.localvars

if [[ `hostname` == "ultron" ]]
then
    xinputs_disable.sh
    setxkbmap -option compose:ralt
    setxkbmap -option ctrl:nocaps
fi



# OH MY ZSH
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="oxide"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  git-extras
  docker
  docker-compose
  taskwarrior
)

source $ZSH/oh-my-zsh.sh

# Vi mode in zsh
bindkey -v
KEYTIMEOUT=1
