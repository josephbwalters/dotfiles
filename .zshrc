# Path to your oh-my-zsh installation.
export ZSH="/Users/jwalters/.oh-my-zsh"

# Set ZSH theme
ZSH_THEME="lambda-mod"
SOLARIZED_THEME="dark"

# Case sensitive auto-completion enabled
CASE_SENSITIVE="true"

# Auto-correction enabled
ENABLE_CORRECTION="true"

# Show that command is running
COMPLETION_WAITING_DOTS="true"

# Speed up git tracking
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Standard plugins found here: ~/.oh-my-zsh/plugins/*
# Custom plugins found here: ~/.oh-my-zsh/custom/plugins/
plugins=(
  rails
  ruby
  rake-fast
  ripgrep
  rbenv
  bundler
  git
  git-auto-fetch
  yarn
  zsh-syntax-highlighting
  zsh-autosuggestions
  zsh-256color
  zsh_reload
  vscode
  common-aliases
  osx
)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# Load fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Shell integration with iterm
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Misc configs for ssl/postgres
export PATH="/usr/local/opt/openssl/bin:$PATH"
export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig:/usr/local/lib/pkgconfig
export PATH="/usr/local/opt/postgresql@9.4/bin:$PATH"

# Misc configs for nvm
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"  # This loads nvm bash_completion

# rbenv setup
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Aliases to simplify common commands
alias tn='cd ~/Documents/TrueNorth'
alias zshrc='${=EDITOR} ~/dotfiles/.zshrc'
alias vimrc='${=EDITOR} ~/dotfiles/init.vim' 
alias ocnc='open -a Google\ Chrome --args --disable-web-security --user-data-dir'

# External Alias that come with some plugins
# https://github.com/robbyrussell/oh-my-zsh/wiki/Plugin:git
# https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/rails
# https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/bundler
# https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/yarn
# https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/vscode
# https://github.com/robbyrussell/oh-my-zsh/blob/master/plugins/common-aliases/common-aliases.plugin.zsh
