alias d="docker"
alias dc="docker-compose"

function docker-stop-all() {
  docker stop $(docker ps -q)
}

function ssh-docker() {
  docker container exec -it "$1" bash
}

function stop-docker() {
  osascript -e 'quit app "Docker"'
}

# SSH onto Docker VM
# https://stackoverflow.com/questions/38532483/where-is-var-lib-docker-on-mac-os-x
function docker-vm() {
  docker run -it --privileged --pid=host debian nsenter -t 1 -m -u -n -i sh
}

alias dce="docker-compose exec"