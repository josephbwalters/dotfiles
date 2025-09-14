{ config, pkgs, ... }:
let
  oos = config.lib.file.mkOutOfStoreSymlink;
  dot = "${config.home.homeDirectory}/dotfiles";
in
{
  #### ZSH ####
  xdg.configFile."zsh/aliases.sh".source      = oos "${dot}/configs/apps/zsh/aliases.sh";
  xdg.configFile."zsh/work_aliases.sh".source = oos "${dot}/configs/apps/zsh/work_aliases.sh";
  # Uncomment if these exist (file or dir):
  # xdg.configFile."zsh/linux".source         = oos "${dot}/configs/apps/zsh/linux";
  # xdg.configFile."zsh/mac".source           = oos "${dot}/configs/apps/zsh/mac";

  programs.zsh = {
    enable = true;
    initExtra = ''
      ZDOT="${XDG_CONFIG_HOME:-$HOME/.config}/zsh"
      for f in "$ZDOT"/*.sh; do [ -r "$f" ] && . "$f"; done
      [ -r "$ZDOT/linux" ] && . "$ZDOT/linux"
      # [ -r "$ZDOT/mac" ]   && . "$ZDOT/mac"
    '';
  };

  #### Neovim (Lua) ####
  xdg.configFile."nvim".source = oos "${dot}/configs/apps/nvim_lua";

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    # extraPackages = with pkgs; [ ripgrep fd unzip gcc ]; # if your config needs them
  };

  #### VS Code (optional) ####
  xdg.configFile."Code/User/settings.json".source =
    oos "${dot}/configs/apps/vscode/settings.json";

  #### Ghostty (optional if you add a config later) ####
  # xdg.configFile."ghostty/config".source = oos "${dot}/configs/apps/ghostty/config";
}

