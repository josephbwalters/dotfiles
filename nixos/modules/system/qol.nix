{ config, pkgs, lib, ... }:
{
  # Faster store; automatic cleanup
  nix.settings.auto-optimise-store = true;
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # SSD health + RAM swap + firmware updates
  services.fstrim.enable = true;
  zramSwap.enable = true;
  services.fwupd.enable = true;

  # Nice tools for rebuilding / logs
  environment.systemPackages = with pkgs; [
    nh                # simpler nix/nixos/home rebuild CLI
    nix-output-monitor # pretty build output: `nom build|switch`
  ];
  programs.nh.enable = true;

  # Prefer Hyprland portal first for screenshare/file pickers
  xdg.portal.config.common.default = [ "hyprland" "gtk" ];
}

