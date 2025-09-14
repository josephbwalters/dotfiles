{ config, pkgs, lib, ... }:
let
  cliPkgs = with pkgs; [
    ripgrep fzf bat tmux zoxide tree tldr neofetch
    stow
  ];

  devPkgs = with pkgs; [
    rustc cargo
    clang clang-tools gnumake
    wget unzip
    nodejs_24 python310
    asdf-vm
    luajitPackages.luarocks
  ];

  desktopPkgs = with pkgs; [
    pavucontrol brightnessctl pamixer
    wl-clipboard grim slurp swappy
    blueman

    ghostty
    vivaldi slack discord obsidian prismlauncher

    pkgs.kdePackages.kwalletmanager
    pkgs.kdePackages.plasma-nm
    pkgs.kdePackages.kwallet
    pkgs.kdePackages.polkit-kde-agent-1
  ];
in
{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;

  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";

  networking.networkmanager.enable = true;

  users.users.adept = {
    isNormalUser = true;
    description = "Joseph Walters";
    extraGroups = [ "wheel" "networkmanager" "input" "video" ];
  };
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  programs.git.enable = true;

  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.printing.enable = true;
  services.upower.enable = true;
  security.polkit.enable = true;
  services.dbus.enable = true;

  services.gnome.gnome-keyring.enable = false;
  # Use KWallet (PAM unlock at greetd + TTY)
  security.pam.services.greetd.kwallet = {
    enable = true;
    forceRun = true;
  };
  security.pam.services.login.kwallet = {
    enable = true;
    forceRun = true;
  };

  security.pam.services.hyprlock = { };


  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    font-awesome
    nerd-fonts.jetbrains-mono
  ];

  environment.systemPackages =
    cliPkgs
    ++ devPkgs
    ++ desktopPkgs;


  networking.firewall = {
    enable = true;
    # Example: open Steam Remote Play or game servers as needed
    # allowedTCPPorts = [ 27036 27037 ];
    # allowedUDPPorts = [ 27031 27036 ];
  };

  # Automatic security updates (unattended)
  # system.autoUpgrade = {
  #   enable = true;
  #   allowReboot = false; # set true if you want auto reboots
  # };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages_latest;

  services.xserver.enable = false;
  services.displayManager.sddm.enable = false;
  services.desktopManager.plasma6.enable = false;
  services.xserver.windowManager.i3.enable = false;

  system.stateVersion = "25.05";
}

