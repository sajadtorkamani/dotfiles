# Composer
alias co="composer"

# Docker
alias d="docker"
alias dc="docker-compose"

function ssh-docker() {
  docker container exec -it "$1" bash
}

# Laravel
alias pa="php artisan"
alias pat="php artisan test"

# NPM
alias n="npm"
alias ni="npm install"
alias nid="npm install -D"
alias nr="npm run"
alias nrestart="rm -rf node_modules package-lock.json  && npm i"

# Rails
alias r="bin/rails"
alias rr="r routes"
alias rs="./bin/rspec"
alias ra="rs"

# Ruby
alias bi="./bin/bundle install"
alias ru="./bin/rubocop"

# Symfony
alias s="symfony"
alias bc="./bin/console"

# System
alias l="ls -l"
alias la="ls -la"
alias ll="ls -l"
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

