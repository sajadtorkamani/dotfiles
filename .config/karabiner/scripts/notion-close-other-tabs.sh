#!/usr/bin/env bash
# Run notion-close-other-tabs.swift, compiling it first if the binary is missing or out of date.
# Karabiner runs this on ctrl+x in Notion. Arguments (e.g. --dry-run) are passed through.
set -euo pipefail

script_directory="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source_file="$script_directory/notion-close-other-tabs.swift"
binary_file="$script_directory/bin/notion-close-other-tabs"

if [[ ! -x "$binary_file" || "$source_file" -nt "$binary_file" ]]; then
  mkdir -p "$script_directory/bin"
  swiftc -O "$source_file" -o "$binary_file"
fi

exec "$binary_file" "$@"
