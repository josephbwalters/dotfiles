{ config, pkgs, lib, ... }:
{
  # 32-bit userspace + modern graphics plumbing (needed for Steam/games)
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  programs.steam = {
    enable = true;
    # Optional niceties:
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = false;
    # gamescopeSession.enable = true; # <- flip on later if you want Gamescope sessions
  };

  # Controller udev rules (DualShock/Xbox/etc.)
  hardware.steam-hardware.enable = true;

  # Handy gaming tools (optional)
  environment.systemPackages = with pkgs; [
    mangohud
    goverlay
    protontricks
  ];
}
