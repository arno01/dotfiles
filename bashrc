#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

git_prompt() {
  source ~/.git-prompt.sh

  GIT_PS1_SHOWDIRTYSTATE=true
  GIT_PS1_SHOWCOLORHINTS=true
  GIT_PS1_STATESEPARATOR=""

  echo -e "\e[90m------------------------------\e[0m"

  local c_blue='\[\e[34m\]'
  local c_red='\[\e[31m\]'
  local c_grey='\[\e[90m\]'
  local c_clear='\[\e[0m\]'
  __git_ps1 "$c_red\w" " ${c_blue}»$c_clear " " $c_blue[%s$c_blue]$c_clear"
}

PROMPT_COMMAND='git_prompt'

export GOPATH=$HOME/code/go
export GOBIN=$GOPATH/bin

export PATH=/usr/local/bin:$HOME/.rbenv/bin:$GOBIN:$(getconf PATH)

export EDITOR="nvim"

# Only call rbenv init if it is installed
if which rbenv >/dev/null; then
  eval "$(rbenv init -)"
fi

# git aliases
alias g='git'
alias ga='git add'
alias gst='git status'
alias gd='git diff'
alias gds='git diff --staged'
alias gpr='git pull --rebase'
alias gp='git push'
alias gc='git commit -v'
alias gco='git checkout'
alias gcm='git checkout master'
alias glg='git log'

# docker aliases
alias db='docker build'
alias dr='docker run'
alias di='docker images'
alias dps='docker ps -a'
alias dip='docker image prune'
alias dcp='docker container prune'
alias dvp='docker volume prune'
alias dri='docker run --rm -it'
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dce='docker-compose exec'

# other aliases
alias b='bundle exec'
alias ..='cd ..'
alias grep='grep --color'
if [ ! $(uname -s) = "Darwin" ]
then
  alias ll='ls -hval --color=auto'
else
  alias ll='ls -hvalG'
fi

# Simulate macOS' pbcopy and pbpaste on other platforms
if [ ! $(uname -s) = "Darwin" ]; then
    alias pbcopy='xclip -sel clip -i'
    alias pbpaste='xclip -sel clip -o'
fi

# List all files after changing current directory
cd() { builtin cd "$@" && ll && test -f .env && source .env; }

# Alias for executing the ".tmux-session" file in the current directory
mux() { ./.tmux-session; }

# Source global env vars
[ -s "$HOME/.env" ] && . "$HOME/.env"

# nvm manages node versions
if [ ! $(uname -s) = "Darwin" ]
then
  source /usr/share/nvm/init-nvm.sh
else
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
fi
