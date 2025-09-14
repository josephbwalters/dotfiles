{ config, pkgs, lib, ... }:
{
  # Compositor
  programs.hyprland.enable = true;

  # Portals for Wayland pickers/screenshare
  xdg.portal.enable = true;
  xdg.portal.extraPortals = with pkgs; [
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
  ];

  # Login manager (Wayland-friendly)
  services.greetd = {
    enable = true;
    settings.default_session = {
      user = "greeter";
      command = "${pkgs.tuigreet}/bin/tuigreet --time --remember --cmd Hyprland";
    };
  };

  # Bluetooth
  services.blueman.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings.General = { Experimental = true; FastConnectable = true; };
    settings.Policy.AutoEnable = true;
  };
}

