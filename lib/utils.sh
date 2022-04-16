# Check if a command exists
function cmd_exists() {
  [[ -x "$(command -v $1)" ]]
}

function is_linux() {
  [[ $(uname) == "Linux" ]]
}

function is_mac() {
  [[ $(uname) == "Darwin" ]]
}

function is_wsl() {
  [[ -f /proc/version && $(grep -i microsoft /proc/version) ]]
}

# Set correct directory permissions
# https://stackoverflow.com/questions/23411520/how-to-fix-error-laravel-log-could-not-be-opened
function fix_laravel_perms() {
  sudo chown -R $USER:www-data storage
  sudo chown -R $USER:www-data bootstrap/cache
  chmod -R 775 storage
  chmod -R 775 bootstrap/cache
}
