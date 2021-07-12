BASE_PATH=$HOME/code/dotfiles

# Source a bunch of files
source $BASE_PATH/lib/utils.sh
source $BASE_PATH/lib/z.sh

# Set env vars
export EDITOR=vim
export PATH="$HOME/.rbenv/bin:$PATH"
export NODE_ENV="development"
export VISUAL=vim
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="avit"

# Load Oh My Zsh
plugins=(composer docker git gem node npm)
source $ZSH/oh-my-zsh.sh

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Load rbenv
eval "$(rbenv init -)"

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

# Setup bash completion for WP-CLI
source $BASE_PATH/lib/wp-completion.sh

if cmd_exists quote; then
  # quote random
fi
