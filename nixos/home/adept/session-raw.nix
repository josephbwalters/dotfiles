{ config, pkgs, lib, ... }:
let
  oos = config.lib.file.mkOutOfStoreSymlink;
  dot = "${config.home.homeDirectory}/dotfiles";

  # Repo paths (adjust if different)
  hyprlandConf  = "${dot}/configs/apps/hypr/hyprland.conf";
  hyprpaperConf = "${dot}/configs/apps/hypr/hyprpaper.conf";
  waybarConf    = "${dot}/configs/apps/waybar/config.jsonc"; # or .../config
  waybarCss     = "${dot}/configs/apps/waybar/style.css";    # default stylesheet
in
{
  ############################################
  ## Hyprland (HM manages session)
  ############################################
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    # NOTE: no extraConfig here (keeps flake eval pure)
  };

  # Provide your Hypr configs at canonical paths (runtime read by Hyprland)
  xdg.configFile."hypr/hyprland.conf".source  = oos hyprlandConf;
  xdg.configFile."hypr/hyprpaper.conf".source = oos hyprpaperConf;

  ############################################
  ## Waybar (HM service + your config/css)
  ############################################
  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };
  xdg.configFile."waybar/config".source    = oos waybarConf;
  xdg.configFile."waybar/style.css".source = oos waybarCss;

  ############################################
  ## Dunst (HM-managed)
  ############################################
  services.dunst.enable = true;

  ############################################
  ## nm-applet / blueman / hyprpaper (user services)
  ############################################
  systemd.user.services."nm-applet" = {
    Unit = {
      Description = "NetworkManager Applet";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.networkmanagerapplet}/bin/nm-applet --indicator";
      Restart = "on-failure";
      RestartSec = 1;
    };
    Install.WantedBy = [ "hyprland-session.target" ];
  };

  systemd.user.services."blueman-applet" = {
    Unit = {
      Description = "Blueman Applet";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.blueman}/bin/blueman-applet";
      Restart = "on-failure";
      RestartSec = 1;
    };
    Install.WantedBy = [ "hyprland-session.target" ];
  };

  systemd.user.services."hyprpaper" = {
    Unit = {
      Description = "Hyprpaper (wallpapers)";
      After = [ "graphical-session.target" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.hyprpaper}/bin/hyprpaper -c ${hyprpaperConf}";
      Restart = "on-failure";
      RestartSec = 1;
    };
    Install.WantedBy = [ "hyprland-session.target" ];
  };

  ############################################
  ## Helpers used by your Waybar bindings
  ############################################
  home.packages = with pkgs; [ btop playerctl pavucontrol wofi ];
}

