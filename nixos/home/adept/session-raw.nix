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

  # Dunst
  services.dunst.enable = true;

  # KDE secret agent stack (KWallet + kded networkmanagement + polkit agent)
  xdg.configFile."kded6rc" = {
    text = ''
      [Module-networkmanagement]
      autoload=true
    '';
    force = true;
  };

  # All user services hook to graphical-session.target (UWSM starts it)
  systemd.user.services."kwalletd6" = {
    Unit = {
      Description = "KWallet daemon (KDE6)";
      After = [ "graphical-session.target" "dbus.service" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.kdePackages.kwallet}/bin/kwalletd6";
      Restart = "on-failure";
      RestartSec = 1;
      Environment = "QT_LOGGING_RULES=*.debug=false";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };

  systemd.user.services."kded6" = {
    Unit = {
      Description = "KDE Daemon (kded6)";
      After = [ "graphical-session.target" "dbus.service" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.kdePackages.kded}/bin/kded6";
      Restart = "on-failure";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };

  systemd.user.services."polkit-kde-agent" = {
    Unit = {
      Description = "Polkit KDE Authentication Agent";
      After = [ "graphical-session.target" "dbus.service" ];
      PartOf = [ "graphical-session.target" ];
    };
    Service = {
      ExecStart = "${pkgs.kdePackages.polkit-kde-agent-1}/libexec/polkit-kde-authentication-agent-1";
      Restart = "on-failure";
    };
    Install.WantedBy = [ "graphical-session.target" ];
  };

  systemd.user.services."blueman-applet" = {
    Unit = {
      Description = "Blueman Applet";
      After = [ "graphical-session.target" "dbus.service" ];
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

  # Vivaldi drun override so kwallet is used from launchers
  xdg.desktopEntries."vivaldi-stable" = {
    name = "Vivaldi";
    genericName = "Web Browser";
    comment = "Browse the Web";
    icon = "vivaldi";
    type = "Application";
    exec = "${pkgs.vivaldi}/bin/vivaldi --password-store=kwallet6 %U";
    terminal = false;
    categories = [ "Network" "WebBrowser" ];
    mimeType = [
      "text/html"
      "x-scheme-handler/http"
      "x-scheme-handler/https"
    ];
  };

  xdg.mimeApps.enable = true;
  xdg.mimeApps.defaultApplications = {
    "text/html" = [ "vivaldi-stable.desktop" ];
    "x-scheme-handler/http"  = [ "vivaldi-stable.desktop" ];
    "x-scheme-handler/https" = [ "vivaldi-stable.desktop" ];
  };

  home.packages = with pkgs; [ btop playerctl pavucontrol wofi ];
}

