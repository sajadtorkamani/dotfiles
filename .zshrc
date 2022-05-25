# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

BASE_PATH=$HOME/code/dotfiles

# Source a bunch of files
source $BASE_PATH/lib/utils.sh
source $BASE_PATH/lib/z.sh

# Set env vars
export EDITOR=vim
export BUND E_EDITOR=mine
export NODE_ENV="development"
export VISUAL=vim
export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="powerlevel10k/powerlevel10k"
export LANG="en_US.UTF-8"

# Set path
export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

if is_mac; then
  export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
  export PATH="/usr/local/sbin:$PATH"
  export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
fi

export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/code/scripts/bin"

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

if cmd_exists pyenv; then
  # Load pyenv
  eval "$(pyenv init -)"

  # Load pyenv-virtualenv
  eval "$(pyenv virtualenv-init -)"
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

# Setup bash completion for WP-CLI
source $BASE_PATH/lib/wp-completion.sh

if cmd_exists inspire; then
  inspire
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# BEGIN SNIPPET: Platform.sh CLI configuration
HOME=${HOME:-'/Users/sajad'}
export PATH="$HOME/"'.platformsh/bin':"$PATH"
if [ -f "$HOME/"'.platformsh/shell-config.rc' ]; then . "$HOME/"'.platformsh/shell-config.rc'; fi # END SNIPPET

