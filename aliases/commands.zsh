# Docker
alias d="docker"
alias dc="docker-compose"

function ssh-docker() {
  docker container exec -it "$1" bash
}

# Laravel
alias pa="php artisan"
alias pat="php artisan test"

# Rails
alias r="bin/rails"
alias rr="r routes"

# System
alias l="ls -la"
alias la="ls -la"
alias ll="ls -la"
alias c="clear"
alias dirsizes="sudo du -sh */ | sort -hr"
alias sizes="du -ahd1"

if is_linux; then
  alias copy="xclip -selection clipboard < $1"
  alias clipboard="xclip -sel clip"
  alias open="xdg-open"
fi

if is_mac; then
  alias chrome="open -a 'Google Chrome'"
  alias clipboard="pbcopy"
fi

# Yarn
alias ya="yarn add"
alias yad="yarn add -D"

