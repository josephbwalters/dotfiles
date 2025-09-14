{ pkgs, config, ... }:
{
  home.username = "adept";
  home.homeDirectory = "/home/adept";
  home.stateVersion = "25.05";

  programs.starship.enable = true;

  # Keep imports lean to avoid double-enabling Hypr/Waybar
  imports = [
    ./dotfiles.nix
    ./session-raw.nix
  ];
}

