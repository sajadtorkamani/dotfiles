alias path='echo $PATH | tr -s ":" "\n"'
alias v="vim"
alias copy-ssh-key="xclip -selection clipboard < ~/.ssh/id_ed25519.pub"
alias isodate="date +'%Y%m%d%H%M%S'"

if is_mac; then
  alias myip="ipconfig getifaddr en0"
fi

function download-playlist() {
  yt-dlp $1 -x --audio-format mp3
}
