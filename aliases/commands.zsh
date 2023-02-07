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
alias nclean="rm -rf node_modules package-lock.json  && npm i"

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
alias dml=" dc exec --user=www-data php bin/console doc:mig:list"
alias dmm=" dc exec --user=www-data php bin/console doc:mig:mig"

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

