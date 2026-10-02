# shellcheck shell=bash

# Symlink aliases from `aliases/` directory into the `~/oh-my-zsh/custom/` directory.
symlink_aliases() {
  local aliases_dir="$ROOT_PATH/aliases"
  local source_path alias_file destination

  shopt -s nullglob dotglob

  for source_path in "$aliases_dir"/*; do
    alias_file="$(basename "$source_path")"
    destination="$HOME/.oh-my-zsh/custom/$alias_file"

    if [[ "$alias_file" == '.idea' ]]; then
      continue
    fi

    if [[ -e "$destination" || -L "$destination" ]]; then
      echo "Skipping: $destination already exists"
    else
      ln -s "$source_path" "$destination"
      echo "Aliases added: $alias_file"
    fi
  done

  shopt -u nullglob dotglob
}
