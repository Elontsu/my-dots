{
  config,
  pkgs,
  inputs,
  ...
}:
{
  hardware = {
    graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = (
        with pkgs;
        [
          libva
          vaapiVdpau
          libvdpau-va-gl
          nvidia-vaapi-driver
        ]
      );
      extraPackages32 = (
        with pkgs.pkgsi686Linux;
        [
          vaapiVdpau
          libvdpau-va-gl
          nvidia-vaapi-driver
        ]
      );
    };
    nvidia = {
      open = true;
      nvidiaSettings = true;
      modesetting.enable = true;
      powerManagement.enable = true;
      forceFullCompositionPipeline = true;
      package = config.boot.kernelPackages.nvidiaPackages.latest;
    };
  };
  services.xserver.videoDrivers = [
    "nvidia"
  ];
}
