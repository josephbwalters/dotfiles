
# -------- Fast start timer (optional) --------
# echo "Starting up..."
# start_time=$(date +%s)

# -------- PATH (put sbin once) --------
export PATH="/usr/local/sbin:$PATH"

# -------- P10k instant prompt (keep at very top) --------
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# -------- Oh My Zsh --------
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
export UPDATE_ZSH_DAYS=14        # fewer update checks = less overhead
unset ENABLE_CORRECTION          # correctness prompts cost latency

# Keep plugins minimal; heavy ones replaced by lazy loaders below
plugins=(git fzf ripgrep tmux autojump)
source "$ZSH/oh-my-zsh.sh"

# -------- Fast completion with cache --------
autoload -Uz compinit
mkdir -p ~/.cache/zsh
compinit -d ~/.cache/zcompdump-$ZSH_VERSION -C
zstyle ':completion:*' rehash true

# -------- Editor --------
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# -------- Aliases (guarded loads) --------
[[ -f ~/Development/dotfiles/zsh/aliases.sh ]] && source ~/Development/dotfiles/zsh/aliases.sh
[[ -f ~/Development/dotfiles/zsh/work_aliases.sh ]] && source ~/Development/dotfiles/zsh/work_aliases.sh

# -------- Common paths / env --------
export sshdir="$HOME/.ssh"
export PATH="$HOME/.poetry/bin:$PATH"


# Perl local::lib (safe quoting; no nested quotes)
export PATH="$HOME/perl5/bin:$PATH"
export PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB:+:$PERL5LIB}"
export PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT:+:$PERL_LOCAL_LIB_ROOT}"
export PERL_MB_OPT="--install_base=$HOME/perl5"
export PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"

# --- thefuck: lazy and non-recursive ---
# Remove any older alias/function to avoid collisions
unalias fuck 2>/dev/null
unfunction fuck 2>/dev/null

_load_thefuck() {
  # One-time bootstrap: define `fix` instead of `fuck`
  # so we never redefine our stub.
  eval "$(thefuck --alias fix)"    # creates alias/function named `fix`
  unfunction _load_thefuck 2>/dev/null
}

# Users still type `fuck`; we load once, then proxy to `fix`
fuck() {
  command -v thefuck >/dev/null 2>&1 || { echo "thefuck not installed"; return 127; }
  typeset -f _load_thefuck >/dev/null && _load_thefuck
  fix "$@"
}

# Optional: hot-load on Ctrl+F (no recursion)
bindkey -s '^F' '_load_thefuck\n'


# nvm — defer until node/npm/npx/nvm is first invoked
lazy_load_nvm() {
  unset -f nvm node npm npx
  export NVM_DIR="$HOME/.nvm"
  if [[ -s "/usr/local/opt/nvm/nvm.sh" ]]; then
    . "/usr/local/opt/nvm/nvm.sh"
  elif [[ -s "$NVM_DIR/nvm.sh" ]]; then
    . "$NVM_DIR/nvm.sh"
  fi
}
nvm() { lazy_load_nvm; nvm "$@"; }
node(){ lazy_load_nvm; node "$@"; }
npm() { lazy_load_nvm; npm "$@"; }
npx() { lazy_load_nvm; npx "$@"; }

# pyenv — defer until python/pip/pyenv is used
lazy_load_pyenv() {
  unset -f pyenv python python3 pip pip3
  command -v pyenv >/dev/null 2>&1 && eval "$(pyenv init -)"
}
pyenv()   { lazy_load_pyenv; pyenv "$@"; }
python()  { lazy_load_pyenv; python "$@"; }
python3() { lazy_load_pyenv; python3 "$@"; }
pip()     { lazy_load_pyenv; pip "$@"; }
pip3()    { lazy_load_pyenv; pip3 "$@"; }

# rbenv — defer until ruby/gem/bundle/rbenv is used
lazy_load_rbenv() {
  unset -f rbenv ruby gem bundle
  command -v rbenv >/dev/null 2>&1 && eval "$(rbenv init -)"
}
rbenv() { lazy_load_rbenv; rbenv "$@"; }
ruby()  { lazy_load_rbenv; ruby "$@"; }
gem()   { lazy_load_rbenv; gem "$@"; }
bundle(){ lazy_load_rbenv; bundle "$@" ; }

# jenv — defer until jenv/java/javac is used
export PATH="$HOME/.jenv/bin:$PATH"
lazy_load_jenv() {
  unset -f jenv java javac
  command -v jenv >/dev/null 2>&1 && eval "$(jenv init -)"
}
jenv()  { lazy_load_jenv; jenv "$@"; }
java()  { lazy_load_jenv; java "$@"; }
javac() { lazy_load_jenv; javac "$@" ; }

# autojump (guarded; fast)
[[ -f /usr/local/etc/profile.d/autojump.sh ]] && . /usr/local/etc/profile.d/autojump.sh

# -------- Prompt config --------
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# -------- Deferred extras (load after prompt) --------
# iTerm2 integration and gcloud completion are non-critical at T0; load on precmd
defer_iterm() { [[ -e "$HOME/.iterm2_shell_integration.zsh" ]] && source "$HOME/.iterm2_shell_integration.zsh"; }
defer_gcloud() {
  [[ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]] && . "$HOME/google-cloud-sdk/path.zsh.inc"
  [[ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]] && . "$HOME/google-cloud-sdk/completion.zsh.inc"
}
precmd_functions+=defer_iterm
precmd_functions+=defer_gcloud

# -------- Optional: compile configs for tiny gains --------
# [[ -f ~/.zshrc ]] && zcompile ~/.zshrc
# [[ -f ~/.p10k.zsh ]] && zcompile ~/.p10k.zsh

# end_time=$(date +%s)
# echo "Ready! Time elapsed: $(($end_time - $start_time)) seconds"
 # echo "Time elapsed from alias to end: $(($end_time - $start_time_alias)) seconds"
