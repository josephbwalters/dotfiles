{ config, pkgs, ... }:
let
  oos = config.lib.file.mkOutOfStoreSymlink;
  dot = "${config.home.homeDirectory}/dotfiles";
in
{
  xdg.enable = true;

  # ZSH files from your repo -> ~/.config/zsh/*
  xdg.configFile."zsh/aliases.sh".source      = oos "${dot}/configs/apps/zsh/aliases.sh";
  xdg.configFile."zsh/work_aliases.sh".source = oos "${dot}/configs/apps/zsh/work_aliases.sh";
  # If these exist, uncomment:
  # xdg.configFile."zsh/linux".source = oos "${dot}/configs/apps/zsh/linux";
  # xdg.configFile."zsh/mac".source   = oos "${dot}/configs/apps/zsh/mac";

  programs.zsh = {
    enable = true;
    initContent = ''
      ZDOT="${config.xdg.configHome}/zsh"
      for f in "$ZDOT"/*.sh; do [ -r "$f" ] && . "$f"; done
      [ -r "$ZDOT/linux" ] && . "$ZDOT/linux"
      # [ -r "$ZDOT/mac" ] && . "$ZDOT/mac"
    '';
  };

  # Neovim from your repo -> ~/.config/nvim
  xdg.configFile."nvim".source = oos "${dot}/configs/apps/nvim_lua";
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  # VS Code settings (optional)
  xdg.configFile."Code/User/settings.json".source =
    oos "${dot}/configs/apps/vscode/settings.json";
}

