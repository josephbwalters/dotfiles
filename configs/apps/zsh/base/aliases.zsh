
# better ls/cat
alias ls='eza --group-directories-first --icons=auto'
alias ll='ls -lah'
alias cat='bat --paging=never'

# safer coreutils
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# git
alias g='git'
alias ga='git add -A'
alias gc='git commit -v'
alias gco='git checkout'
alias gb='git branch -vv'
alias gl='git log --oneline --graph --decorate --all'

# httpie
alias GET='http --follow --timeout 30 --verbose GET'

# zoxide helper
alias zc='z -'
