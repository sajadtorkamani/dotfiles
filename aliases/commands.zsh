alias l="ls -l"
alias la="ls -l"
alias ll="ls -l"
alias c="clear"

alias pa="php artisan"
alias pat="php artisan test"

alias copy="xclip -selection clipboard < $1"

alias d="docker"

function ssh-docker() {
  docker container exec -it "$1" bash
}

if is_linux; then
  alias open="xdg-open"
fi
