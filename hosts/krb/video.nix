{ pkgs, ... }:

{
  boot.initrd.kernelModules = [ "amdgpu" ];
  hardware.amdgpu.overdrive.enable = true;
  services.xserver.videoDrivers = [ "amdgpu" ];

  environment.systemPackages = with pkgs; [ corectrl ];
}
