# modules/system/wayland.nix
{ config, pkgs, lib, ... }:
{
  ############################################
  # Wayland compositor: Hyprland via UWSM
  ############################################
  programs.hyprland = {
    enable = true;
    # Let Hyprland integrate with UWSM so user session targets are brought up.
    withUWSM = true;
  };

  # xdg-desktop-portal stack (same as before)
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk
    ];
  };

  ############################################
  # Login: greetd -> tuigreet -> UWSM -> Hyprland
  ############################################
  services.greetd = {
    enable = true;
    settings.default_session = {
      user = "greeter";
      # Launch Hyprland through UWSM (provided by programs.hyprland.withUWSM)
      # This ensures graphical-session.target is active for your user services.
      command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd 'uwsm start hyprland-uwsm.desktop'";
    };
  };

  ############################################
  # QoL services you already use
  ############################################
  services.blueman.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings.General = { Experimental = true; FastConnectable = true; };
    settings.Policy.AutoEnable = true;
  };

  ############################################
  # Wayland-friendly env (kept from your setup)
  ############################################
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}

