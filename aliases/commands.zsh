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

# System
alias l="eza -l"
alias la="eza -la"
alias c="clear"
alias dirsizes="sudo du -sh */ | sort -hr"
alias sizes="du -ahd1"
alias setup-dots="php $HOME/code/dotfiles/scripts/setup.php"

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
