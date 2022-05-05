alias aliases="cd $HOME/code/dotfiles/aliases && l"
alias debs="cd $HOME/Downloads/Debs && l"
alias docs="cd $HOME/Documents && l"
alias dots="cd $HOME/code/dotfiles && l"
alias downloads="cd $HOME/Downloads && l"
alias dumps="cd $HOME/dumps && l"
alias fleets="cd $HOME/Downloads/Fleeting && l"
alias home="cd ~ && l"
alias hosts="$EDITOR /etc/hosts"
alias sites="cd $HOME/sites && l"

if is_linux; then
  alias confs="cd /etc/nginx/sites-available && l"
else
  alias confs="cd /opt/homebrew/etc/nginx/sites-available && l"
fi
