# Composer
alias co="composer"

# Laravel
alias pa="php artisan"
alias pat="php artisan test"

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
alias fix-tmp-permissions=" docker compose exec php chmod 777 -R /tmp/cache &&  docker compose exec php chmod 777 -R /tmp/log"
alias cc="dc exec php bin/console cache:clear"
alias cct="docker compose exec php bin/console cache:clear --env=test"
alias dml=" dc exec --user=www-data php bin/console doc:mig:list"
alias dmm=" dc exec --user=www-data php bin/console doc:mig:mig"
alias dmr=" dc exec --user=www-data php bin/console doc:mig:mig prev"
alias dmd=" dc exec --user=www-data php bin/console doc:mig:diff"
alias dx="dc exec --user=www-data php"

# System
alias l="exa -l"
alias la="exa -la"
alias c="clear"
alias dirsizes="sudo du -sh */ | sort -hr"
alias sizes="du -ahd1"
alias setup-dots="$HOME/code/dotfiles/scripts/setup.php"

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

# Misc
alias update-aliases="php $HOME/code/dotfiles/scripts/setup.php && szconf"
alias xde="./xdebug.sh enable"
alias xdd="./xdebug.sh disable"
