BASE_PATH=$HOME/code/dotfiles

# Source a bunch of files
source $BASE_PATH/lib/utils.sh
source $BASE_PATH/lib/external/z.sh

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
export JEDI_ENV=dev

source "$BASE_PATH/lib/setup-path.zsh"


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
  source "$BASE_PATH/lib/configure-linux.zsh"
fi

# Load bash completion scripts (https://tinyurl.com/ycsj3adx)
autoload bashcompinit
bashcompinit

# Setup bash completions
source $BASE_PATH/lib/external/wp-completion.sh
source $BASE_PATH/lib/external/deno-completion.sh

# bun completions
[ -s "/Users/sajad/.bun/_bun" ] && source "/Users/sajad/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# AWS
# aws configure export-credentials --profile default --format env  > /dev/null 2>&1
eval "$(aws configure export-credentials --profile default --format env)"

[ -f ~/.inshellisense/key-bindings.zsh ] && source ~/.inshellisense/key-bindings.zsh

if cmd_exists pyenv; then
  eval "$(pyenv init -)"
fi


# Enable shell completion for 1Password CLI
# https://developer.1password.com/docs/cli/reference/#shell-completion
eval "$(op completion zsh)"; compdef _op op

