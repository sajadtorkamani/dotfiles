source ./lib/utils.zsh

initializers=(
  "env_vars"
  "ohmyzsh"
  "rbenv"
  "remap_keys"
  "system"
)

for initializer in "${initializers[@]}"
do
  source ./shell_initializers/$initializer.zsh
done
