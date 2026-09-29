#!/usr/bin/env bash
set -euo pipefail

scripts_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_PATH="$(dirname "$scripts_dir")"
IS_LINUX=false
IS_MAC=false

case "$(uname -s)" in
  Linux) IS_LINUX=true ;;
  Darwin) IS_MAC=true ;;
esac

export ROOT_PATH IS_LINUX IS_MAC

source "$scripts_dir/clone_vim_packages.sh"
source "$scripts_dir/symlink_aliases.sh"
source "$scripts_dir/symlink_dotfiles.sh"

clone_vim_packages
symlink_aliases
symlink_dotfiles
