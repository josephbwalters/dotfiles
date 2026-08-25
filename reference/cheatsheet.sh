#!/usr/bin/env bash
# Quick reference — shell & tmux shortcuts

B=$'\033[1m'       # bold
D=$'\033[2m'       # dim
R=$'\033[0m'       # reset
CY=$'\033[1;36m'   # cyan bold   — headers
GR=$'\033[1;32m'   # green bold  — section titles
YL=$'\033[0;33m'   # yellow      — keys
WH=$'\033[0;37m'   # white       — descriptions

W=$(tput cols 2>/dev/null || echo 72)
HR="${D}$(printf '%.0s─' $(seq 1 $((W > 80 ? 80 : W))))${R}"

header()  { echo; echo -e "  ${CY}${B}$1${R}"; echo -e "  $HR"; }
section() { echo; echo -e "    ${GR}${B}$1${R}"; echo; }
row()     { printf "    ${YL}${B}%-22s${R}  ${WH}%s${R}\n" "$1" "$2"; }

# ── Title ──────────────────────────────────────────────────────────────
echo
title="Shell & Tmux Quick Reference"
pad=$(( (W - ${#title}) / 2 ))
printf "%${pad}s${B}${CY}%s${R}\n" "" "$title"
echo

# ── Tmux ───────────────────────────────────────────────────────────────
header "TMUX  (prefix = C-a)"

section "Sessions"
row "prefix + f"        "Sessionize — fzf pick a repo, open session"
row "prefix + s"        "Switch between sessions (fzf)"
row "prefix + \$"       "Rename current session"
row "prefix + d"        "Detach"

section "Windows"
row "prefix + c"        "New window"
row "prefix + n / p"    "Next / previous window"
row "prefix + ,"        "Rename window"

section "Panes"
row "prefix + |"        "Split vertical"
row "prefix + -"        "Split horizontal"
row "C-\\ / C--"        "Split (no prefix needed)"
row "C-h/j/k/l"         "Navigate panes (nvim-aware)"
row "M-h/j/k/l"         "Resize panes"
row "prefix + z"        "Zoom / unzoom pane"
row "prefix + x"        "Kill pane"

section "Copy mode (vi)"
row "prefix + ["        "Enter copy mode"
row "v"                 "Begin selection"
row "y"                 "Yank to clipboard"
row "q"                 "Exit copy mode"

# ── ZSH ────────────────────────────────────────────────────────────────
header "ZSH ALIASES"

section "Navigation"
row "z <dir>"           "Jump to dir (zoxide)"
row "zc"                "z - (jump back)"
row "ts"                "Sessionize (fzf → new tmux session)"
row "tw"                "Switch tmux session (fzf)"

section "Files"
row "ls"                "eza --group-directories-first --icons"
row "ll"                "ls -lah"
row "cat"               "bat --paging=never"
row "rm / cp / mv"      "Interactive (asks before overwrite)"

section "Git"
row "g"                 "git"
row "ga"                "git add -A"
row "gc"                "git commit -v"
row "gco"               "git checkout"
row "gb"                "git branch -vv"
row "gl"                "git log --oneline --graph --decorate --all"

section "Other"
row "GET"               "http --follow --timeout 30 --verbose GET"
row "cheat"             "Show this guide"

# ── FZF ────────────────────────────────────────────────────────────────
header "FZF KEY BINDINGS"
echo
row "C-r"               "Search shell history"
row "C-t"               "Insert file path"
row "M-c"               "cd into directory"
echo
