function is_linux {
  [[ $(uname) == "Linux" ]]
}

function clip {
  echo $1 | xclip -selection clipboard
}
