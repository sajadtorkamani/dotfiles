alias path='echo $PATH | tr -s ":" "\n"'
alias v="vim"
alias isodate="date +'%Y%m%d%H%M%S'"
alias phpexec="dc exec --user=www-data php"

function rsp() {
  dc exec php ./bin/console app:reset-roles-and-permissions --summary &&
    dc exec php ./bin/console c:c
}

function phpcs() {
  docker-compose exec --user=www-data php vendor/bin/php-cs-fixer --config=.php-cs-fixer.dist.php fix
}

function download-playlist() {
  yt-dlp $1 -x --audio-format mp3
}

function copy-ssh-key() {
  if is_mac; then
    alias copy-ssh-key="pbcopy < ~/.ssh/id_ed25519.pub"
  else
    alias copy-ssh-key="xclip -selection clipboard < ~/.ssh/id_ed25519.pub"
  fi
}

function npms() {
  open "https://www.npmjs.com/package/$1"
}

alias npmlsg="npm ls -g --depth=0"
