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

if hash nvim 2>/dev/null; then
  export EDITOR=/usr/bin/nvim
fi

GIT_EDITOR=$EDITOR
VISUAL=$EDITOR

#DISABLE crtl+s in terminal
stty ixany
stty ixon -ixoff

#GO
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin:/usr/lib/go/bin
#RUST BIN
export PATH=$PATH:$HOME/.cargo/bin:$HOME
#LOCAL PATH
export PATH=$PATH:$HOME/.local/bin

#NVM
nvm() {
  unset -f nvm
  export NVM_DIR=~/.nvm
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This lo      ads nvm
  nvm "$@"
}

node() {
  unset -f node
  export NVM_DIR=~/.nvm
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  node "$@"
}

npm() {
  unset -f npm
  export NVM_DIR=~/.nvm
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  npm "$@"
}
export NVM_LAZY_LOAD=true

#LOCALVARS
if [ ! -f $HOME/.localvars ]
then
    touch $HOME/.localvar
fi

source $HOME/.localvars

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
if [ -z "$ZSH" ]; then
 export ZSH=$HOME/.oh-my-zsh
fi

# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  ssh-agent
  zsh-navigation-tools
  docker
  history-substring-search
  ansible
  golang
  rust
  systemd
  pass
)

export CASE_SENSITIVE="true"
source $ZSH/oh-my-zsh.sh
source $HOME/.aliases

# Vi mode in zsh
bindkey -v
KEYTIMEOUT=1

if hash starship 2>/dev/null; then
  eval "$(starship init zsh)"
else
  export ZSH_THEME="oxide"
fi

if hash lsd 2>/dev/null; then
  alias ls='lsd'
fi

if [ -z $DISPLAY ] && [ -n $XDG_VTNR ] && [ "$XDG_VTNR" -eq 1 ]; then
  exec startx
fi

if [[ "$TMUX" == "" ]]; then
    WHOAMI=$(whoami)
    if tmux has-session -t $WHOAMI 2>/dev/null; then
      tmux -2 attach-session -t $WHOAMI
    else
        tmux -2 new-session -s $WHOAMI
    fi
fi