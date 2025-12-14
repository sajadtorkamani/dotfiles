#!/usr/bin/env bash

# Appends paths to the PATH env variable

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$PYENV_ROOT/bin:$PATH"

if is_mac; then
  export PATH="/Applications/Postgres.app/Contents/Versions/latest/bin:$PATH"
  export PATH="/usr/local/sbin:$PATH"
  export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
  export PATH="/Applications/PhpStorm.app/Contents/MacOS:$PATH"

  # Herd injected PHP binary.
  export PATH="$HOME/Library/Application Support/Herd/bin/":$PATH

  # https://stackoverflow.com/a/47111756/2302835
  if cmd_exists python; then
    export PATH="$PATH:$(python -m site --user-base)/bin"
  fi
fi

export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$HOME/code/scripts/bin"
export PATH="$PATH:$HOME/code/scripts/bin/rq"
export PATH="$PATH:$HOME/code/scripts/bin/jsoft"
export PATH="$PATH:$HOME/code/bin"
export PATH="$PATH:$DENO_INSTALL/bin"
export PATH=$HOME/.dotnet/tools:$PATH
