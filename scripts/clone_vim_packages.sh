# shellcheck shell=bash

clone_vim_packages() {
  local repo_url repo_name destination

  for repo_url in "${vim_package_repo_urls[@]}"; do
    repo_name="$(basename "$repo_url")"
    destination="$ROOT_PATH/.vim/pack/plugins/start/$repo_name"

    if [[ -e "$destination" ]]; then
      echo "Skipping: $destination already exists"
    else
      git clone "$repo_url" "$destination"
      echo "Cloned: $repo_name to $destination"
    fi
  done
}

vim_package_repo_urls=(
  'https://github.com/jiangmiao/auto-pairs'
  'https://github.com/ctrlpvim/ctrlp.vim'
  'https://github.com/preservim/nerdtree'
  'https://github.com/vim-airline/vim-airline'
  'https://github.com/prettier/vim-prettier'
  'https://github.com/vim-syntastic/syntastic'
)
