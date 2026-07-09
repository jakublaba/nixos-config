{
  lib,
  config,
  ...
}: let
  cfg = config.my.hardware.virtualization;
in {
  options.my.hardware.virtualization = {
    enable = lib.mkEnableOption "virtualization";
    users = lib.mkOption {
      type = lib.types.listOf lib.types.str;
      default = [];
      description = "Users allowed to access virtualization services";
    };
  };

  config = lib.mkIf cfg.enable {
    # normal vms
    programs.virt-manager.enable = true;
    users.groups.libvirtd.members = cfg.users;
    virtualisation.libvirtd.enable = true;
    virtualisation.spiceUSBRedirection.enable = true;

    # docker
    virtualisation.docker.enable = true;
    users.groups.docker.members = cfg.users;
  };
}
