alias docs="cd $HOME/Documents && l"
alias hosts="sudo $EDITOR /etc/hosts"
alias code="cd $HOME/code && l"
alias sites="cd $HOME/sites && l"
alias fleets="cd $HOME/Downloads/Fleeting && l"
alias aliases="$EDITOR ~/.oh-my-zsh/custom/aliases.zsh"

if is_linux; then
  alias confs="cd /etc/nginx/sites-available && l"
else
  alias confs="cd /usr/local/etc/nginx/sites-available && l"
fi
