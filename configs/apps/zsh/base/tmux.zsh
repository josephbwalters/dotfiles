
# Sessionizer (ThePrimeagen-style)
sessionize() {
  local dir name
  dir=$(fd --type d --hidden --follow --exclude .git . ${1:-$HOME} | fzf --height 50% --reverse) || return
  name=$(basename "$dir" | tr ' .:' '-' )
  if tmux has-session -t "$name" 2>/dev/null; then
    tmux switch-client -t "$name"
  else
    tmux new-session -ds "$name" -c "$dir" && tmux switch-client -t "$name"
  fi
}
alias ts='sessionize'

# Auto-attach only on interactive TTY, not inside tmux/SSH commands
if command -v tmux >/dev/null 2>&1; then
  if [ -z "$TMUX" ] && [ -t 1 ] && [ -z "$SSH_TTY" ]; then
    tmux attach -t base 2>/dev/null || tmux new -s base
  fi
fi

# Quick new tmux window in CWD
alias tn='tmux new-window -c "$PWD"'

# Jump between sessions
alias tj='tmux switch-client -t $(tmux list-sessions -F "#{session_name}" | fzf)'
