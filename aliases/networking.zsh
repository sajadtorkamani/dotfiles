# Kill all processes listening on a given port
function killport() {
  lsof -i tcp:$1 | awk 'NR!=1 {print $2}' | xargs -r kill
}

# Find out what process is listening on a given port
function port() {
  sudo lsof -i :$1
}

if is_mac; then
  alias myip="ipconfig getifaddr en0"
fi

# List all ports in use
alias ports="sudo lsof -Pn -i"

# Homebrew
alias b="brew"
alias bs="brew services"

alias transfer="rsync -LPa"
