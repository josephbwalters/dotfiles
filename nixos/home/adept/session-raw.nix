{ config, pkgs, lib, ... }:
let
  oos = config.lib.file.mkOutOfStoreSymlink;
  dot = "${config.home.homeDirectory}/dotfiles";

  hyprlandConf  = "${dot}/configs/apps/hypr/hyprland.conf";
  hyprpaperConf = "${dot}/configs/apps/hypr/hyprpaper.conf";
  waybarConf    = "${dot}/configs/apps/waybar/config.jsonc";  # or .../config
  waybarCss     = "${dot}/configs/apps/waybar/style.css";     # default Waybar stylesheet
in
{
  # Hyprland (use your file)
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    extraConfig = builtins.readFile hyprlandConf;
  };

  # Place configs at canonical paths
  xdg.configFile."hypr/hyprland.conf".source  = oos hyprlandConf;
  xdg.configFile."hypr/hyprpaper.conf".source = oos hyprpaperConf;

  # Waybar (HM runs it; Waybar auto-loads style.css)
  programs.waybar = {
    enable = true;
    systemd.enable = true;
  };
  xdg.configFile."waybar/config".source    = oos waybarConf;
  xdg.configFile."waybar/style.css".source = oos waybarCss;

  # Dunst via HM (remove any `exec-once = dunst` from hyprland.conf)
  services.dunst.enable = true;

  # Other session helpers as user services
  systemd.user.services."nm-applet" = {
    Unit = { Description = "NetworkManager Applet"; After = [ "graphical-session.target" ]; PartOf = [ "graphical-session.target" ]; };
    Service = { ExecStart = "${pkgs.networkmanagerapplet}/bin/nm-applet --indicator"; Restart = "on-failure"; RestartSec = 1; };
    Install.WantedBy = [ "hyprland-session.target" ];
  };

  systemd.user.services."blueman-applet" = {
    Unit = { Description = "Blueman Applet"; After = [ "graphical-session.target" ]; PartOf = [ "graphical-session.target" ]; };
    Service = { ExecStart = "${pkgs.blueman}/bin/blueman-applet"; Restart = "on-failure"; RestartSec = 1; };
    Install.WantedBy = [ "hyprland-session.target" ];
  };

  systemd.user.services."hyprpaper" = {
    Unit = { Description = "Hyprpaper (wallpapers)"; After = [ "graphical-session.target" ]; PartOf = [ "graphical-session.target" ]; };
    Service = { ExecStart = "${pkgs.hyprpaper}/bin/hyprpaper -c ${hyprpaperConf}"; Restart = "on-failure"; RestartSec = 1; };
    Install.WantedBy = [ "hyprland-session.target" ];
  };

  home.packages = with pkgs; [ btop playerctl pavucontrol wofi ];
}

