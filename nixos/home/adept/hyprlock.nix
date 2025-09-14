{ config, pkgs, ... }:

{
  # Hyprlock itself
  programs.hyprlock = {
    enable = true;
    package = pkgs.hyprlock; # explicit, optional
    settings = {
      # --- simple example config; tweak to taste ---
      general = {
        disable_loading_bar = false;
        hide_cursor = true;
        grace = 2; # seconds before it starts rejecting input
      };

      background = [
        {
          monitor = "";                               # all monitors
          path = "$HOME/Pictures/wallpapers/current.jpg";
          blur_passes = 3;
          blur_size = 5;
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "300, 80";
          position = "0, -120";
          halign = "center";
          valign = "center";
          rounding = 12;
        }
      ];

      label = [
        { text = "  $USER"; font_size = 16; position = "0, 20";  halign = "center"; valign = "center"; }
        { text = "  %Y-%m-%d    %H:%M"; font_size = 18; position = "0, -40"; halign = "center"; valign = "center"; }
      ];
    };
  };

  # Optional: auto-lock on idle with hypridle
  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";   # how to lock
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd  = "hyprctl dispatch dpms on";
      };
      listener = [
        { timeout = 300; on-timeout = "loginctl lock-session"; } # 5 min: lock
        {
          timeout = 600;
          on-timeout = "hyprctl dispatch dpms off";             # 10 min: display off
          on-resume  = "hyprctl dispatch dpms on";
        }
      ];
    };
  };
}
