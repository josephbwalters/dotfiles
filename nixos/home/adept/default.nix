{ pkgs, config, ... }:
{
  home.username = "adept";
  home.homeDirectory = "/home/adept";
  home.stateVersion = "25.05";

  programs.starship.enable = true;
  services.dunst.enable = true;

  home.packages = with pkgs; [ ghostty wofi pavucontrol ];

  imports = [
    ./dotfiles.nix
    ./session-raw.nix
    # ./hyprland.nix
    # ./waybar.nix
  ];
}

