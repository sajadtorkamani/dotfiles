CWD=$HOME/code/dotfiles

source $CWD/lib/utils.zsh

initializers=(
  "env_vars"
  "keyboard_speed"
  "nvm"
  "ohmyzsh"
  "path"
  "rbenv"
  "remap_keys"
  "system"
  "wp-cli_completion"
)

for initializer in "${initializers[@]}"
do
  source $CWD/shell_initializers/$initializer.zsh
done

php $CWD/scripts/inspire.php
