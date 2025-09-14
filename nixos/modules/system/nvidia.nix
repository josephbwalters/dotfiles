{ config, pkgs, lib, ... }:
{
  services.xserver.videoDrivers = [ "nvidia" ];
  hardware.graphics = { enable = true; enable32Bit = true; };

  hardware.nvidia = {
    modesetting.enable = true;
    nvidiaSettings = true;
    open = false;                 # set true if your card supports it
    powerManagement.enable = true;# disable if resume issues
    package = config.boot.kernelPackages.nvidiaPackages.production;

    # For hybrid laptop later (PRIME offload). Fill bus IDs & flip nvidia=true in flake:
    # prime = {
    #   offload.enable = true;
    #   intelBusId  = "PCI:0:2:0";
    #   nvidiaBusId = "PCI:1:0:0";
    # };
  };

  environment.variables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __NV_PRIME_RENDER_OFFLOAD = "1";
    NIXOS_OZONE_WL = "1";
  };
}

