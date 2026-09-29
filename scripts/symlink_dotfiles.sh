# shellcheck shell=bash

symlink_dotfiles() {
  local dotfiles=(
    '.gitignore_global'
    '.rspec'
    '.tmux.conf'
    '.vim'
    '.vimrc'
    '.zshrc'
    '.ideavimrc'
    '.inputrc'
    'deno.json'
    '.config/herdr/config.toml'
    '.config/herdr/scripts'
  )
  local dotfile target link

  for dotfile in "${dotfiles[@]}"; do
    target="$ROOT_PATH/$dotfile"
    link="$HOME/$dotfile"

    if [[ -e "$link" || -L "$link" ]]; then
      echo "Skipped: $link already exists"
    else
      mkdir -p "$(dirname "$link")"
      ln -s "$target" "$link"
      echo "Symlinked: $link points to $target"
    fi
  done
}
