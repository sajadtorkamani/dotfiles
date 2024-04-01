alias d="docker"
alias dc="docker compose"
alias dcr="docker compose down && docker compose up -d"

function restart-docker() {
  quit-docker
  open-docker
}

function docker-stop-all() {
  docker stop $(docker ps -q)
}

function ssh-docker() {
  docker container exec -it "$1" bash
}

function quit-docker() {
  if is_mac; then
    osascript -e 'quit app "Docker"'
  else
    echo "Don't know how to exit Docker on non-macOS system."
    exit 1
  fi
}

# SSH onto Docker VM
# https://stackoverflow.com/questions/38532483/where-is-var-lib-docker-on-mac-os-x
function docker-vm() {
  docker run -it --privileged --pid=host debian nsenter -t 1 -m -u -n -i sh
}

alias dce="docker compose exec"

function open-docker() {
  open -a Docker
}

function is-docker-project() {
  if [ -f "docker-compose.yml" ]; then
    return 0
  else
    return 1
  fi
}
