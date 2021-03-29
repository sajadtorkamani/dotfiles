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
)

for initializer in "${initializers[@]}"
do
  source $CWD/shell_initializers/$initializer.zsh
done

php scripts/print_quote.php
