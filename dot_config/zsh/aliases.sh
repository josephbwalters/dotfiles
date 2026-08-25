#!/bin/zsh

# Brew Updates for Homebrew
alias brewup="brew update && brew upgrade --greedy && brew cleanup && brew doctor"

# Map everything vi/vim to neovim
alias editor="nvim"
alias v="nvim"
alias vi="nvim"
alias vim="nvim"

# Git
alias gi="git"
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

# others covered by zsh plugin

# General Aliases
alias c="clear"
alias k="clear"
alias q="exit"
alias gs="gst"
alias gst="git status"
alias s="source"
alias zrc="v ~/.zshrc" # zc is taken by zoxide's "jump back" in mac/.zshrc
alias rld="s ~/.zshrc"
alias vc="v ~/.config/nvim/init.lua"
alias randhex="openssl rand -hex"
alias dev="cd ~/Development"
alias dotf="cd ~/Development/dotfiles"
alias r="ruby"

alias pipr="pip install -r requirements.txt"
alias mvenv="python3 -m venv venv"
alias svenv="s venv/bin/activate"
alias msvenv="mvenv && svenv"

# Directory Garbage <3
alias u="cd .."
alias uu="u && u"
alias u2="uu"
alias uuu="uu && u"
alias u3="uuu"
alias uuuu="uuu && u"
alias u4="uuuu"
alias uuuuu="uuuu && u"
alias u5="uuuuu"
alias o="open ."
alias desk="cd ~/Desktop"
alias down="cd ~/Downloads"
alias mkd="mkdir"
alias l="ls -lt" # eza's ls alias (mac/.zshrc) already applies here
alias lc="wc -l"

alias qq='tmux kill-session -t $(tmux display-message -p "#S")'

# Quick new tmux window in CWD
alias tn='tmux new-window -c "$PWD"'

# Jump between existing tmux sessions
alias tj='tmux switch-client -t $(tmux list-sessions -F "#{session_name}" | fzf)'

# Fast grep
rgf() { rg -n --hidden --glob '!.git' "$@" }

# Git helpers
gundo() { git reset --hard "$1"; git clean -fd; }

# Project opener (ts already picks a dir; open code + tmux)
codehere() { command -v code >/dev/null && code . || true; }
