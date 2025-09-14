{ pkgs, config, ... }:
{
  home.username = "adept";
  home.homeDirectory = "/home/adept";
  home.stateVersion = "25.05";

  programs.starship.enable = true;

  # Keep imports lean to avoid double-enabling Hypr/Waybar
  imports = [
    ./dotfiles.nix
    ./keyring.nix
    ./applets.nix
    ./hyprland.nix
    ./hyprlock.nix
    ./notifications.nix
  ];
}

