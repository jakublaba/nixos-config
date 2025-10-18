{
  lib,
  config,
  ...
}: let
  cfg = config.my.hardware.virtualization;
in {
  options.my.hardware.virtualization.enable = lib.mkEnableOption "virtualization";

  config = lib.mkIf cfg.enable {
    # normal vms
    programs.virt-manager.enable = true;
    users.groups.libvirtd.members = ["kuba"];
    virtualisation.libvirtd.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;

    # docker
    virtualisation.docker.enable = true;
    users.groups.docker.members = ["kuba"];
  };
}
