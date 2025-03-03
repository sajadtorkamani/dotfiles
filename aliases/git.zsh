alias gs="git status"
alias gd="git diff"
alias gdc="git diff --cached"
alias ga="git add"
alias gc="git commit"
alias gcb="git checkout -b"
alias gch="git checkout"
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
alias gf="git push origin HEAD --force"
alias gpu="git pull"
alias gwip="git add . && git commit -m 'wip' && git push origin HEAD"
alias gcwip="ga . && gc --amend -m 'wip' && gp --force"
alias gref="git add . && git commit -m 'Refactor' && git push origin HEAD"
alias gsty="git add . && git commit -m 'Style' && git push origin HEAD"
alias numcommits="git rev-list HEAD --count"
alias gbranch="git symbolic-ref --short HEAD"
alias gut="git ls-files -o -z --exclude-standard | xargs -0"
alias gupstream='git branch --set-upstream-to=origin/git symbolic-ref --short HEAD`'
alias gbranches='git for-each-ref --sort=-committerdate refs/heads/ --format="%(committerdate:iso8601) %(refname:short)" | head'
alias gbranchesall='git for-each-ref --sort=-committerdate refs/heads/ --format="%(committerdate:iso8601) %(refname:short)"'

function gbackup() {
  backupBranch="backup/$(gbranch)--$(isodate)"
  git checkout -b $backupBranch
}

# GitHub CLI aliases
function gview() {
  gh browse -b $(gbranch)
}

alias gcreate=" gh repo create --private --source ."
