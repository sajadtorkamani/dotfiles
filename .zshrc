CWD=$HOME/code/dotfiles

source $CWD/lib/utils.zsh

initializers=(
  "env-vars"
  "keyboard-speed"
  "nvm"
  "ohmyzsh"
  "path"
  "rbenv"
  "remap-keys"
  "system"
  "wp-completion"
  "z"
)

for initializer in "${initializers[@]}"
do
  source $CWD/shell-initializers/$initializer.sh
done

php $CWD/scripts/inspire.php
