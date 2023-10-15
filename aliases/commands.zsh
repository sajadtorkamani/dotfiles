# Composer
alias co="composer"

# Laravel
alias pa="php artisan"
alias pat="php artisan test"

# NPM
alias n="npm"
alias ni="npm install"
alias nu="npm uninstall"
alias nid="npm install -D"
alias nr="npm run"
alias nclean="rm -rf node_modules package-lock.json && npm i"

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
alias fix-tmp-permissions=" docker-compose exec php chmod 777 -R /tmp/cache &&  docker-compose exec php chmod 777 -R /tmp/log"
alias cc="docker-compose exec php bin/console cache:clear"
alias cct="docker-compose exec php bin/console cache:clear --env=test"
alias dml=" dc exec --user=www-data php bin/console doc:mig:list"
alias dmm=" dc exec --user=www-data php bin/console doc:mig:mig"
alias dmr=" dc exec --user=www-data php bin/console doc:mig:mig prev"
alias dmd=" dc exec --user=www-data php bin/console doc:mig:diff"
alias dx="dc exec --user=www-data php"

# PHP
alias puaa="dc exec php ./clear-test-db.sh && export SYMFONY_DEPRECATIONS_HELPER=weak && php -d memory_limit=3072M ./vendor/bin/phpunit"
alias pua="dc exec php ./clear-test-db.sh && export SYMFONY_DEPRECATIONS_HELPER=weak && php -d memory_limit=3072M ./vendor/bin/phpunit --stop-on-failure"
alias puf="dc exec php ./clear-test-db.sh && export SYMFONY_DEPRECATIONS_HELPER=weak && php -d memory_limit=3072M ./vendor/bin/phpunit --stop-on-failure --filter"

# System
alias l="exa -l"
alias la="exa -la"
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

# Misc
alias update-aliases="php $HOME/code/dotfiles/scripts/setup.php && szconf"
alias xde="./xdebug.sh enable"
alias xdd="./xdebug.sh disable"
