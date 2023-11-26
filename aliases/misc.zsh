alias path='echo $PATH | tr -s ":" "\n"'
alias v="vim"
alias isodate="date +'%Y%m%d%H%M%S'"
alias phpexec="dc exec --user=www-data php"

function rsp() {
  dc exec php ./bin/console app:reset-roles-and-permissions --summary &&
    dc exec php ./bin/console c:c
}

# Run specific PHPUnit tests inside Docker Composer service
function dtf() {
  if [ -z "$1" ]; then
    echo "Please provide a test filter"
    return
  fi

  dce php /bin/bash -c "
    ./clear-test-db.sh &&
    export SYMFONY_DEPRECATIONS_HELPER=weak &&
    php -d memory_limit=3072M ./vendor/bin/phpunit  --stop-on-failure  --filter $1
  "
}

function ctd() {
  dce php /bin/bash -c "./clear-test-db.sh"
}

# Run all PHPUnit tests inside Docker Composer service
function dta() {
  dce php /bin/bash -c "./test-parallel.sh"
}

function dci() {
  dce php /bin/bash -c "composer install"
}

function dsh() {
  dce "$1" /bin/bash
}

function dbash() {
  dce "$1" /bin/bash
}

function bc() {
  dce php /bin/bash -c "bin/console $1"
}

function phpcs() {
  docker compose exec --user=www-data php vendor/bin/php-cs-fixer --config=.php-cs-fixer.dist.php fix
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
alias asl="aws sso login"
