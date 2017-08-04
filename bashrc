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

  local c_blue='\[\e[34m\]'
  local c_red='\[\e[31m\]'
  local c_grey='\[\e[90m\]'
  local c_clear='\[\e[0m\]'
  __git_ps1 "$c_red\w" " $c_blue»$c_clear " " $c_blue[%s$c_blue]$c_clear"
}

PROMPT_COMMAND='git_prompt'

export GOPATH=$HOME/code/go
export GOBIN=$GOPATH/bin

export PATH=/usr/local/bin:$HOME/.rbenv/bin:/usr/bin:/bin:$HOME/.bin:/usr/sbin:/sbin:/usr/X11/bin:./node_modules/.bin:$GOBIN:$PATH

export EDITOR="nvim"

# Only call rbenv init if it is installed
if which rbenv >/dev/null; then
  eval "$(rbenv init -)"
fi

alias g='git'
alias b='bundle exec'
alias ..='cd ..'
alias ll='ls -hval --color=auto'
alias grep='grep --color'

if [ ! $(uname -s) = "Darwin" ]; then
    # Simulate OSX's pbcopy and pbpaste on other platforms
    alias pbcopy='xclip -sel clip -i'
    alias pbpaste='xclip -sel clip -o'
fi

# List all files after changing current directory
cd() { builtin cd "$@" && ll && test -f .env && source .env; }

# Alias for executing the ".tmux-session" file in the current directory
mux() { ./.tmux-session; }

# nvm manages node versions
source /usr/share/nvm/init-nvm.sh
