BASE_PATH=$HOME/code/dotfiles

# Source a bunch of files
source $BASE_PATH/lib/utils.sh
source $BASE_PATH/lib/z.sh

# Set env vars
export AWS_PROFILE=default
export DENO_INSTALL="$HOME/.deno"
export EDITOR=vim
export IDE="phpstorm"
export LANG="en_US.UTF-8"
export PYENV_ROOT="$HOME/.pyenv"
export NODE_ENV="development"
export VISUAL=vim
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="avit"

# Set path
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"

if is_mac; then
  export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
  export PATH="/usr/local/sbin:$PATH"
  export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
  export PATH="/Applications/PhpStorm.app/Contents/MacOS:$PATH"

  # Herd injected PHP 8.3 configuration.
  export HERD_PHP_83_INI_SCAN_DIR="$HOME/Library/Application Support/Herd/config/php/83/"

  # Herd injected PHP binary.
  export PATH="$HOME/Library/Application Support/Herd/bin/":$PATH

  # https://stackoverflow.com/a/47111756/2302835
  if cmd_exists python; then
    export PATH="$PATH:$(python -m site --user-base)/bin"
  fi
fi

export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/code/scripts/bin"
export PATH="$PATH:$HOME/code/scripts/bin/rq"
export PATH="$PATH:$HOME/code/bin"
export PATH="$PATH:$DENO_INSTALL/bin"
# export PATH="/opt/homebrew/opt/mysql-client@8.4/bin:$PATH"

# Load Oh My Zsh
plugins=(composer docker git gem node npm)
source $ZSH/oh-my-zsh.sh

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Load rbenv
if cmd_exists rbenv; then
  eval "$(rbenv init -)"
fi


if is_linux; then
  # Prevent ctrl+s from freezing terminal (https://tinyurl.com/nsr9z9p8)
  stty -ixon

  # Remap caps lock to act as Escape when short-pressed and as Ctrl when long-pressed.
  setxkbmap -option ctrl:nocaps
  xcape -e 'Control_L=Escape'

  # Set keyboard speed
  gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 30
  gsettings set org.gnome.desktop.peripherals.keyboard delay 250
fi

# Load bash completion scripts (https://tinyurl.com/ycsj3adx)
autoload bashcompinit
bashcompinit

# Setup bash completions
source $BASE_PATH/lib/wp-completion.sh
source $BASE_PATH/lib/deno.sh

# BEGIN SNIPPET: Platform.sh CLI configuration
HOME=${HOME:-'/Users/sajad'}
export PATH="$HOME/"'.platformsh/bin':"$PATH"
if [ -f "$HOME/"'.platformsh/shell-config.rc' ]; then . "$HOME/"'.platformsh/shell-config.rc'; fi # END SNIPPET

# bun completions
[ -s "/Users/sajad/.bun/_bun" ] && source "/Users/sajad/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# AWS
 #aws configure export-credentials --profile default --format env  > /dev/null 2>&1
eval "$(aws configure export-credentials --profile default --format env)"

[ -f ~/.inshellisense/key-bindings.zsh ] && source ~/.inshellisense/key-bindings.zsh

if cmd_exists pyenv; then
  eval "$(pyenv init -)"
fi

# Herd injected PHP binary.
export PATH="/Users/sajadtorkamani/Library/Application Support/Herd/bin/":$PATH

# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="/Users/sajadtorkamani/Library/Application Support/Herd/config/php/83/"

export PATH=$HOME/.dotnet/tools:$PATH

# Enable shell completion for 1Password CLI
# https://developer.1password.com/docs/cli/reference/#shell-completion
eval "$(op completion zsh)"; compdef _op op
