{ pkgs, config, ... }:
let
  mod = "SUPER";
  wp = "${config.home.homeDirectory}/Pictures/wallpapers/default.jpg";
in {
  # Hyprpaper via HM (no exec-once)
  services.hyprpaper = {
    enable = true;
    settings = {
      preload   = [ wp ];
      wallpaper = [ ",${wp}" ];
      splash = false;
    };
  };

  # Hyprland via HM
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true; # fine to keep even if you start via uwsm
    settings = {
      "$mod" = mod;

      general = {
        gaps_in = 6;
        gaps_out = 12;
        border_size = 2;
        layout = "dwindle";
      };

      decoration = {
        rounding = 10;
        blur = { enabled = true; size = 8; passes = 1; };
        shadow = {
          enabled = true;
          range = 4;
          render_power = 3;
          color = "rgba(00000080)";
        };
      };

      animations = {
        enabled = true;
        bezier = [ "overshot,0.05,0.9,0.1,1.1" ];
        animation = [
          "windows,1,5,overshot,popin 80%"
          "fade,1,4,default"
          "workspaces,1,4,overshot"
        ];
      };

      input = {
        kb_layout = "us";
        touchpad = { natural_scroll = true; };
      };

      # IMPORTANT: No autostart here—systemd/HM owns them.
      # "exec-once" = [ ];

      bind = [
        "${mod}, Return, exec, ghostty"
        "${mod}, D,      exec, wofi --show drun"
        "${mod}, F,      fullscreen"
        "${mod}, V,      togglefloating"
        "${mod}, P,      exec, grim -g \"$(slurp)\" - | swappy -f -"
        "${mod}, Q,      killactive"

        "${mod}, 1, workspace, 1"
        "${mod}, 2, workspace, 2"
        "${mod}, 3, workspace, 3"
        "${mod}, 4, workspace, 4"
        "${mod}, 5, workspace, 5"
      ];

      binde = [
        ", XF86AudioRaiseVolume, exec, pamixer -i 5"
        ", XF86AudioLowerVolume, exec, pamixer -d 5"
        ", XF86AudioMute,        exec, pamixer -t"
        ", XF86MonBrightnessUp,   exec, brightnessctl set +5%"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
      ];

      windowrulev2 = [
        "float,class:^(pavucontrol)$"
        "float,class:^(nm-connection-editor)$"
        "float,class:^(blueman-manager)$"
      ];
    };
  };
}

