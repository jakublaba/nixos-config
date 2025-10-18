{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.my.hardware.gpu;
in {
  options.my.hardware.gpu.enable = lib.mkEnableOption "gpu";

  config = lib.mkIf cfg.enable {
    boot.initrd.kernelModules = ["amdgpu"];
    services.xserver.videoDrivers = ["amdgpu"];

    hardware.graphics = {
      enable = true;
      enable32Bit = true;

      extraPackages = with pkgs; [
        rocmPackages.clr.icd
      ];
    };
  };
}
