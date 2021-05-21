alias docs="cd $HOME/Documents && l"
alias hosts="$EDITOR /etc/hosts"
alias confs="cd /etc/nginx/sites-available && l"
alias code="cd $HOME/code && l"
alias sites="cd $HOME/sites && l"
alias fleets="cd $HOME/Downloads/Fleeting && l"
alias aliases="cd $HOME/code/dotfiles/aliases && l"
alias downloads="cd $HOME/Downloads && l"
alias debs="cd $HOME/Downloads/Debs && l"
alias dumps="cd $HOME/dumps && l"
alias dots="cd $HOME/code/dotfiles && l"

if is_linux; then
  alias confs="cd /etc/nginx/sites-available && l"
else
  alias confs="cd /usr/local/etc/nginx/sites-available && l"
fi
