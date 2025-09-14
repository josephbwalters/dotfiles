{ config, pkgs, ... }:
let
  oos = config.lib.file.mkOutOfStoreSymlink;
  dot = "${config.home.homeDirectory}/dotfiles";
in
{
  xdg.enable = true;

  # --- Zsh dotfiles from your repo -> ~/.config/zsh/*
  xdg.configFile."zsh/aliases.sh".source      = oos "${dot}/configs/apps/zsh/aliases.sh";
  xdg.configFile."zsh/work_aliases.sh".source = oos "${dot}/configs/apps/zsh/work_aliases.sh";
  # If these exist, uncomment:
  # xdg.configFile."zsh/linux".source = oos "${dot}/configs/apps/zsh/linux";
  # xdg.configFile."zsh/mac".source   = oos "${dot}/configs/apps/zsh/mac";

  programs.zsh = {
    enable = true;

    # Persistent history (XDG location) + sensible limits
    history = {
      path = "${config.xdg.dataHome}/zsh/history";
      save = 100000;
      size = 100000;
      share = true;
      extended = true;
      ignoreSpace = true;  # commands starting with space aren't saved
    };

    # Use initContent (initExtra is deprecated)
    initContent = ''
      # Load your per-file snippets from ~/.config/zsh/*.sh
      ZDOT="${config.xdg.configHome}/zsh"
      for f in "$ZDOT"/*.sh; do [ -r "$f" ] && . "$f"; done
      [ -r "$ZDOT/linux" ] && . "$ZDOT/linux"
      # [ -r "$ZDOT/mac" ] && . "$ZDOT/mac"

      # Emacs-style keymap
      bindkey -e

      # Ctrl-R: prefer fzf's history widget; fallback to native incremental search
      if (( $+functions[fzf-history-widget] )) || (( $+widgets[fzf-history-widget] )); then
        bindkey '^R' fzf-history-widget
      else
        bindkey '^R' history-incremental-search-backward
      fi
    '';
  };

  # fzf integration provides the fzf-history-widget (Ctrl-R fuzzy search)
  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    # Optional extras:
    # defaultCommand = "rg --files --hidden --follow --glob '!.git/*'";
  };

  # --- Neovim from your repo -> ~/.config/nvim
  xdg.configFile."nvim".source = oos "${dot}/configs/apps/nvim_lua";
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  # --- VS Code settings (optional)
  xdg.configFile."Code/User/settings.json".source =
    oos "${dot}/configs/apps/vscode/settings.json";
}

