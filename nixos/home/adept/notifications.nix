{ config, pkgs, lib, ... }:
# let
#   oos = config.lib.file.mkOutOfStoreSymlink;
#   dot = "${config.home.homeDirectory}/dotfiles";
# in
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        frame_color = "#89b4fa";
        separator_color = "frame";
        highlight = "#89b4fa";
      };

      urgency_low = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
      };

      urgency_normal = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
      };

      urgency_critical = {
        background = "#1e1e2e";
        foreground = "#cdd6f4";
        frame_color = "#fab387";
      };
    };
  };

  # optional: keep linking your repo version too
  # home.file.".config/dunst" = {
  #   source = oos "${dot}/configs/apps/dunst";
  #   recursive = true;
  # };
}

