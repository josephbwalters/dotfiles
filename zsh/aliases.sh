#!/bin/zsh

# Map everything vi/vim to neovim
alias v="nvim"
alias vi="nvim"
alias vim="nvim"

# General Aliases
alias c="clear"
alias q="exit"
alias gs="gst"
alias s="source"
alias zc="v ~/.zshrc"
alias rld="s ~/.zshrc"
alias vc="v ~/.config/nvim/init.vim"
alias randhex="openssl rand -hex"
alias dev="cd ~/Development"
alias dotf="cd ~/Development/dotfiles"
alias r="ruby"

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
alias ls="ls -G"
alias l="ls -l"
alias lc="wc -l"

# Extra git stuff
# Most git aliases are managed through zsh plugin
alias gbr='git checkout $(git branch | fzf)'

