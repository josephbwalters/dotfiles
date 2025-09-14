{
  description = "NixOS + Home Manager: Hyprland/Waybar, per-host NVIDIA, dotfiles-friendly";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    mkSystem = { hostName, system ? "x86_64-linux", nvidia ? false }:
      nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/${hostName}/configuration.nix
          ./modules/system/common.nix
          ./modules/system/wayland.nix
          ./modules/system/gaming.nix
          (if nvidia then ./modules/system/nvidia.nix else {})

          # Home Manager as a NixOS module
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.backupFileExtension = "backup";   # <— add this
            home-manager.users.adept = import ./home/adept/default.nix;
          }
        ];
      };
  in {
    nixosConfigurations = {
      desktop = mkSystem { hostName = "desktop"; nvidia = true;  };
      laptop  = mkSystem { hostName = "laptop";  nvidia = false; };
    };
  };
}

