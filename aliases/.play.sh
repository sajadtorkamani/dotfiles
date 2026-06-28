#!/usr/bin/env bash

set -eou pipefail


function glastcommit() {
  last_commit=$(git log --pretty=format:"%s" --date=relative -n 1 | head -n 1)

  echo "$last_commit" > pbcopy

  echo "Last commit was: $last_commit (Copied to clipboard)"
}



glastcommit