# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="tomorrow-custom"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how many often would you like to wait before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Necessary for using tmux
DISABLE_AUTO_TITLE=true

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git-custom)

source $ZSH/oh-my-zsh.sh

export GOPATH=$HOME/code/go
export GOBIN=$GOPATH/bin

export PATH=/usr/local/bin:$HOME/.rbenv/bin:/usr/bin:/bin:$HOME/.bin:/usr/sbin:/sbin:/usr/X11/bin:./node_modules/.bin:$GOBIN

export EDITOR="nvim"

# Only call rbenv init if it is installed
if which rbenv >/dev/null; then
  eval "$(rbenv init -)"
fi

alias b='bundle exec'
alias ..='cd ..'
alias ll='ls -hval'
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

# Increase the maximum number of file descriptors since it is very low by default on OS X
ulimit -n 2048

# nvm manages node versions
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# Source autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh
