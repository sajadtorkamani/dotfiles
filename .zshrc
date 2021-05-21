CWD=$HOME/code/dotfiles

source $CWD/lib/utils.sh

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

if cmd_exists quote; then
  quote
fi

