{ config, pkgs, lib, ... }:
let
  oos = config.lib.file.mkOutOfStoreSymlink;
  dot = "${config.home.homeDirectory}/dotfiles";

  hyprlandConf  = "${dot}/configs/apps/hypr/hyprland.conf";
  hyprpaperConf = "${dot}/configs/apps/hypr/hyprpaper.conf";
  waybarConf    = "${dot}/configs/apps/waybar/config.jsonc";
  waybarCss     = "${dot}/configs/apps/waybar/style.css";
in
{
  # Just place configs; Hyprland reads ~/.config/hypr/hyprland.conf by default.
  xdg.configFile."hypr/hyprland.conf".source  = oos hyprlandConf;
  xdg.configFile."hypr/hyprpaper.conf".source = oos hyprpaperConf;

  # Waybar (HM manages as user service)
  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };
  xdg.configFile."waybar/config".source    = oos waybarConf;
  xdg.configFile."waybar/style.css".source = oos waybarCss;

 systemd.user.services."hyprpaper" = {
    Unit = {
      Description = "Hyprpaper (wallpapers)";
      After = [ "graphical-session.target" "dbus.service" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.hyprpaper}/bin/hyprpaper -c ${hyprpaperConf}";
      Restart = "on-failure";
      RestartSec = 1;
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };

  # Theme
  home.packages = with pkgs; [
    catppuccin
    catppuccin-kde
  ];
}
