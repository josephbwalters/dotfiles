
# Update system (your safe Nix rebuild)
alias update='nix build ~/dotfiles/nixos#nixosConfigurations.desktop.config.system.build.toplevel && sudo ./result/bin/switch-to-configuration switch'

# General quality-of-life
alias c="clear"
alias k="clear"
alias q="exit"
alias qq='tmux kill-session -t $(tmux display-message -p "#S")'
alias randhex="openssl rand -hex"
alias isup="is-up"
alias o="open ."
