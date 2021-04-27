function cmd_exists() {
  [[ -x "$(command -v $1)" ]]
}

function is_linux() {
  [[ $(uname) == "Linux" ]]
}

function copy() {
  xclip -selection clipboard <$1
}

function weather() {
  city="$1"

  if [ -z "$city" ]; then
    city="Romford"
  fi

  eval "curl http://wttr.in/${city}"
}
