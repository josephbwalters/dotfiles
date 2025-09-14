{ config, pkgs, lib, ... }:
{
  ############################################
  # Core graphics plumbing (incl. 32-bit)
  ############################################
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    # NVIDIA VA-API bridge for NVDEC/NVENC (video playback/recording)
    extraPackages = with pkgs; [ nvidia-vaapi-driver ];
  };

  ############################################
  # Steam + controller rules
  ############################################
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = false;
    # Flip on if you want a full Gamescope session launcher in Steam:
    # gamescopeSession.enable = true;
  };
  hardware.steam-hardware.enable = true;

  ############################################
  # Per-game performance boosts
  ############################################
  programs.gamemode.enable = true;

  ############################################
  # Gaming/tooling you’ll actually use
  ############################################
  environment.systemPackages = with pkgs; [
    # Performance & overlays
    mangohud            # in-game FPS/frametime/temps overlay
    gamescope           # micro-compositor: frame pacing, scaling, fps caps
    goverlay            # GUI for MangoHud/Gamemode/Gamescope

    # Proton / Wine helpers
    protontricks
    protonup-qt         # easy Proton-GE install/updates
    lutris
    wineWowPackages.stable
    winetricks

    # NVIDIA / Vulkan utilities
    vulkan-tools        # vulkaninfo, vkcube
    vkbasalt            # post-processing (CAS/sharpen); enable per-game
    nvtopPackages.nvidia# GPU/VRAM monitor

    # Capture/stream (uses NVENC with ffmpeg-full)
    ffmpeg-full
    obs-studio

    # Handy runtime for non-Steam titles
    steam-run
  ];

  ############################################
  # Optional per-user defaults (can also live in HM)
  ############################################
  environment.sessionVariables = {
    # Keep MangoHud available; you can disable per-game if you prefer.
    MANGOHUD = "1";
    MANGOHUD_CONFIG = "full,log_duration=60,cpu_temp,gpu_temp,ram,vrAM,io_read,io_write,frame_timing";
    # Don’t force vkBasalt globally; turn on per game:
    # VK_INSTANCE_LAYERS = "vkBasalt";
  };
}

