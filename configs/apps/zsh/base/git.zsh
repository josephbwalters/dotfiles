
# Git
alias gi="git"
alias ti="tig"
alias gbr='git checkout $(git branch | fzf)'
alias pull="git pull"
alias push="git push"
alias add="git add"
alias gdiff="git diff"
alias gdif="gdiff"
alias commit="git commit -m"
alias checkout="git checkout"
alias checkoutb="git checkout -b"
alias restore="git restore"
alias stash="git stash"
alias status="git status"
alias gs="gst"
alias gst="git status"

# Undo helper
gundo() { git reset --hard "$1"; git clean -fd; }
