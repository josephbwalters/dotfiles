#### Paths (put sbin once) ####
export PATH="/usr/local/sbin:/usr/local/bin:/opt/homebrew/bin:$HOME/.local/bin:$PATH"


#### History ####
HISTFILE=$HOME/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt HIST_IGNORE_DUPS HIST_IGNORE_ALL_DUPS HIST_REDUCE_BLANKS HIST_VERIFY EXTENDED_HISTORY SHARE_HISTORY


#### Completion & keys ####
autoload -Uz compinit && compinit -C
bindkey -e # emacs keys; change to -v for vim if you prefer


#### Prompt (Starship) ####
# If you prefer Powerlevel10k, comment these two lines and use your p10k setup instead.
eval "$(starship init zsh)"
export STARSHIP_CONFIG="$HOME/.config/starship.toml"


#### Quality of life ####
# fzf, zoxide, direnv
[ -f "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh" ] && source "$(brew --prefix)/opt/fzf/shell/key-bindings.zsh"
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"


# Better ls/cat
alias ls='eza --group-directories-first --icons=auto'
alias ll='ls -lah'
alias cat='bat --paging=never'


# Safer rm/cp/mv
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'


# Git shortcuts
alias g='git'
# alias gs='git status -sb'
alias ga='git add -A'
alias gc='git commit -v'
alias gco='git checkout'
alias gb='git branch -vv'
alias gl='git log --oneline --graph --decorate --all'


# HTTPie convenience
alias GET='http --follow --timeout 30 --verbose GET'


# Jump (zoxide)
alias zc='z -'


#### ThePrimeagen‑style Sessionizer (fzf + tmux) ####
sessionize() {
local dir
dir=$(fd --type d --hidden --follow --exclude .git . ${1:-$HOME} | fzf --height 50% --reverse) || return
local name
name=$(basename "$dir" | tr '.' '-' | tr ' ' '-')
if tmux has-session -t "$name" 2>/dev/null; then
tmux switch-client -t "$name"
else
tmux new-session -ds "$name" -c "$dir"
tmux switch-client -t "$name"
fi
}
alias ts='sessionize'


#### Auto attach to tmux in Ghostty/TTY ####
if command -v tmux >/dev/null 2>&1; then
# do nothing if already inside tmux or in an SSH forced command etc.
if [ -z "$TMUX" ] && [ -t 1 ]; then
# attach to last session, or create a base one
tmux attach -t base 2>/dev/null || tmux new -s base
fi
fi


eval "$(luarocks --lua-version=5.4 path --bin)"
#### Optional: load per-machine aliases ####
# If your files are named *.sh, source those; otherwise use the dotfiles you actually have.
[ -f "$HOME/Development/dotfiles/configs/apps/zsh/aliases.sh" ] && source "$HOME/Development/dotfiles/configs/apps/zsh/aliases.sh"
[ -f "$HOME/Development/dotfiles/configs/apps/zsh/work_aliases.sh" ] && source "$HOME/Development/dotfiles/configs/apps/zsh/work_aliases.sh"
[ -f "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"
