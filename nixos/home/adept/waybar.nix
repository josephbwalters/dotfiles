{ pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
    settings = [{
      layer = "top"; position = "top"; height = 28;
      modules-left = [ "hyprland/workspaces" "hyprland/window" ];
      modules-center = [ "clock" ];
      modules-right = [ "cpu" "memory" "network" "pulseaudio" "battery" "tray" ];

      clock = { interval = 1; format = "{:%a %b %d  %H:%M:%S}"; tooltip-format = "{:%Y-%m-%d}"; };
      cpu = { format = " {usage}%"; };
      memory = { format = " {used:0.1f}G"; };
      network = {
        format-wifi = " {essid} {signalStrength}%";
        format-ethernet = "󰈀 {ifname}";
        format-disconnected = "";
      };
      pulseaudio = {
        format = "{icon} {volume}%"; format-muted = ""; on-click = "pavucontrol";
        format-icons = { default = [ "" "" "" ]; };
      };
      battery = { format = "{capacity}% {icon}"; "format-icons" = [ "" "" "" "" "" ]; states = { warning = 25; critical = 10; }; };
      tray = { spacing = 8; };
    }];
    style = builtins.readFile ./themes/waybar.css;
  };
}

