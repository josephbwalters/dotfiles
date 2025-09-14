{ config, pkgs, lib, ... }:
{
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

   home.packages = with pkgs; [ btop playerctl pavucontrol wofi ];
}

