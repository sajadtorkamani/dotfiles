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

function fix-wp-perms() {
#  chown -R :www .
  sudo chown -R :www-data wp-content/
  sudo chown -R :www-data wp-includes/
  sudo chown -R :www-data wp-admin/

  sudo chmod -R g+rwx wp-content/
  sudo chmod -R g+rwx wp-admin/
  sudo chmod -R g+rwx wp-includes/
}
