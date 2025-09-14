{ config, pkgs, lib, ... }:
let
  # ---- Package groups (easy to scan/modify) ----
  cliPkgs = with pkgs; [
    ripgrep fzf bat tmux zoxide tree tldr thefuck neofetch
    stow
  ];

  devPkgs = with pkgs; [
    rustc cargo
    clang clang-tools gnumake
    wget unzip
    nodejs_24 python310
    asdf-vm
  ];

  desktopPkgs = with pkgs; [
    # desktop helpers (system-level)
    pavucontrol brightnessctl pamixer
    wl-clipboard grim slurp swappy
    networkmanagerapplet blueman

    # apps (optional)
    ghostty
    vivaldi slack discord obsidian prismlauncher
  ];
in
{
  # Flakes + unfree
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  # Locale / time
  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";

  # Networking (use NM; no plaintext wifi config)
  networking.networkmanager.enable = true;

  # User
  users.users.adept = {
    isNormalUser = true;
    description = "Joseph Walters";
    extraGroups = [ "wheel" "networkmanager" "input" "video" ];
  };
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  programs.git.enable = true;

  # Audio (PipeWire)
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Useful services
  services.printing.enable = true;   # CUPS
  services.upower.enable = true;     # power stats for Waybar, etc.
  services.gnome.gnome-keyring.enable = true;
  security.polkit.enable = true;

  # Fonts (icons + Nerd Font)
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    font-awesome
    nerd-fonts.jetbrains-mono
  ];

  # System packages (assembled from groups)
  environment.systemPackages =
    cliPkgs
    ++ devPkgs
    ++ desktopPkgs;

  # Boot + kernel
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Ensure we don't fight Hyprland/greetd (managed in wayland.nix)
  services.xserver.enable = false;
  services.displayManager.sddm.enable = false;
  services.desktopManager.plasma6.enable = false;
  services.xserver.windowManager.i3.enable = false;

  # State version (match your install; don't bump casually)
  system.stateVersion = "25.05";
}

