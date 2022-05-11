alias path='echo $PATH | tr -s ":" "\n"'
alias v="vim"
alias isodate="date +'%Y%m%d%H%M%S'"

function download-playlist() {
  yt-dlp $1 -x --audio-format mp3
}

function copy-ssh-key() {
  if is_mac; then
    alias copy-ssh-key="pbcopy < ~/.ssh/id_ed25519.pub"
  else
    alias copy-ssh-key="xclip -selection clipboard < ~/.ssh/id_ed25519.pub"
  fi
}

function npms() {
  open "https://www.npmjs.com/package/$1"
}
