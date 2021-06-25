CWD=$HOME/code/dotfiles

source $CWD/lib/utils.sh

initializers=(
  "env-vars"
  "functions"
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
  source $CWD/shell_initializers/$initializer.sh
done

if cmd_exists quote; then
  quote random
fi

