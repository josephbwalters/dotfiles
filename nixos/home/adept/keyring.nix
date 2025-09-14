{ config, pkgs, lib, ... }:
{
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

}
