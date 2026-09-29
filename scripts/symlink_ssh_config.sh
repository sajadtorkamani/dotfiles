# shellcheck shell=bash

# Deprecated: Not using this at the moment.
symlink_ssh_config() {
  local target
  local link="$HOME/.ssh/config"

  target="$(get_ssh_config)"

  if [[ -e "$link" || -L "$link" ]]; then
    echo "Skipped: $link already exists"
  else
    ln -s "$target" "$link"
    echo "Symlinked: $link points to $target"
  fi
}

get_ssh_config() {
  local file

  if [[ "$IS_MAC" == true ]]; then
    file='ssh_config.mac'
  else
    file='ssh_config.linux'
  fi

  echo "$ROOT_PATH/$file"
}
