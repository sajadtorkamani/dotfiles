alias gs="git status"
alias gd="git diff"
alias ga="git add"
alias gc="git commit"
alias gcb="git checkout -b"
alias gcp="git cherry-pick"
alias gl='git log --pretty=format:"%C(yellow)%h %C(white)%s %C(blue)%ad %C(green)(%an)" --date=relative'
alias gl1='git log --pretty=format:"%C(yellow)%h %C(white)%s %C(blue)%ad %C(green)(%an)" --date=relative'
alias glast="git show"
alias gfo="git fetch origin"
alias gst="git stash -u"
alias gstap="git stash apply"
alias gsl="git stash list"
alias gr="git remote -v"
alias gu="git reset HEAD"
alias gp="git push origin HEAD"
alias gpu="git pull"
alias gwip="git add . && git commit -m 'WIP' && git push origin HEAD"
alias gref="git add . && git commit -m 'Refactor' && git push origin HEAD"
alias gsty="git add . && git commit -m 'Style' && git push origin HEAD"
alias numcommits="git rev-list HEAD --count"
alias gbranch="git symbolic-ref --short HEAD"

function gbackup() {
  backupBranch="backup/$(gbranch)--$(isodate)"
  git checkout -b $backupBranch
}

# GitHub CLI aliases
alias gview="gh repo view -w"
alias gcreate=" gh repo create --private --source ."
