alias aliases="$IDE $HOME/code/dotfiles/aliases"
alias debs="cd $HOME/Downloads/Debs && l"
alias docs="cd $HOME/Documents && l"
alias dots="$IDE $HOME/code/dotfiles"
alias scripts="$IDE $HOME/code/scripts"
alias downloads="cd $HOME/Downloads && l"
alias dumps="cd $HOME/dumps && l"
alias fleets="cd $HOME/Downloads/Fleeting && l"
alias home="cd ~ && l"
alias hosts="sudo $EDITOR /etc/hosts"
alias sites="cd $HOME/sites && l"
alias vaults="cd $HOME/Google\ Drive/My\ Drive/Obsidian\ Vaults && l"

if is_linux; then
  alias confs="cd /etc/nginx/sites-available && l"
else
  alias confs="cd /opt/homebrew/etc/nginx/sites-available && l"
fi
