
{ config, pkgs, ... }:
let
  oos = config.lib.file.mkOutOfStoreSymlink;
  dot = "${config.home.homeDirectory}/dotfiles";
in
{
  xdg.enable = true;

  # --- Zsh ---
  programs.zsh = {
    enable = true;

    # Load Zsh from repo-managed config
    initContent = ''
      export ZDOTDIR="$HOME/dotfiles/configs/apps/zsh"
      if [ -r "$ZDOTDIR/main.zsh" ]; then
        . "$ZDOTDIR/main.zsh"
      else
        echo "[zsh] main.zsh not found in $ZDOTDIR" >&2
      fi
    '';
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  # --- Neovim ---
  xdg.configFile."nvim".source = oos "${dot}/configs/apps/nvim_lua";
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
  };

  #### ghostty theme and configs ####
  xdg.configFile."ghostty".source = oos "${dot}/configs/apps/ghostty";

  #### tmux theme and configs ####
  home.file.".tmux.conf" = {
    source = oos "${dot}/configs/apps/tmux/tmux.conf";
    force = true;
  };
  home.file.".config/tmux/tmux.conf" = {
    source = oos "${dot}/configs/apps/tmux/tmux.conf";
    force = true;
  };
  
  # Ensure tools for clipboard on Linux/Wayland are present
  home.packages = with pkgs; [
    wl-clipboard   # wl-copy/wl-paste for Wayland
    xclip          # fallback for X11
    tmux
    git            # TPM needs git
  ];

  # --- VSCode (uncomment if needed) ---
  # xdg.configFile."Code/User/settings.json".source =
  #   oos "${dot}/configs/apps/vscode/settings.json";
}

