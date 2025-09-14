{ config, pkgs, ... }:
let
  oos = config.lib.file.mkOutOfStoreSymlink;
  dot = "${config.home.homeDirectory}/dotfiles";
in
{
  # Ensure XDG variables exported in the session
  xdg.enable = true;

  #### ZSH files from your repo -> ~/.config/zsh/*
  xdg.configFile."zsh/aliases.sh".source       = oos "${dot}/configs/apps/zsh/aliases.sh";
  xdg.configFile."zsh/work_aliases.sh".source  = oos "${dot}/configs/apps/zsh/work_aliases.sh";
  # Uncomment if these exist in your repo:
  # xdg.configFile."zsh/linux".source          = oos "${dot}/configs/apps/zsh/linux";
  # xdg.configFile."zsh/mac".source            = oos "${dot}/configs/apps/zsh/mac";

  programs.zsh = {
    enable = true;
    # Safe: uses HM's path (no shell ${…})
    initExtra = ''
      ZDOT="${config.xdg.configHome}/zsh"
      for f in "$ZDOT"/*.sh; do [ -r "$f" ] && . "$f"; done
      [ -r "$ZDOT/linux" ] && . "$ZDOT/linux"
      # [ -r "$ZDOT/mac" ] && . "$ZDOT/mac"
    '';
  };

  #### Neovim (Lua) from your repo -> ~/.config/nvim
  xdg.configFile."nvim".source = oos "${dot}/configs/apps/nvim_lua";

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    # extraPackages = with pkgs; [ ripgrep fd unzip gcc ];
  };

  #### VS Code settings (optional)
  xdg.configFile."Code/User/settings.json".source =
    oos "${dot}/configs/apps/vscode/settings.json";
}

