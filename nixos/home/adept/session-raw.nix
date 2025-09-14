
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
  # Place Hypr configs; Hyprland itself is provided/launched by NixOS (greetd)
  xdg.configFile."hypr/hyprland.conf".source  = oos hyprlandConf;
  xdg.configFile."hypr/hyprpaper.conf".source = oos hyprpaperConf;

  # Waybar managed by HM
  programs.waybar = {
    enable = true;
    systemd.enable = true;  # user service -> graphical-session.target
  };
  xdg.configFile."waybar/config".source    = oos waybarConf;
  xdg.configFile."waybar/style.css".source = oos waybarCss;

  # Dunst via HM (ensure hyprland.conf does NOT also exec-once dunst)
  services.dunst.enable = true;

  # nm-applet / blueman / hyprpaper as user services
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
    Install.WantedBy = [ "graphical-session.target" ];
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
    Install.WantedBy = [ "graphical-session.target" ];
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
    Install.WantedBy = [ "graphical-session.target" ];
  };

  # Tools your Waybar binds use
  home.packages = with pkgs; [ btop playerctl pavucontrol wofi ];
}
