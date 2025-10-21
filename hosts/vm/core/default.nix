{...}: {
  imports = [
    ./boot.nix
    # todo add vm hardware config in the repo
    ./hardware-configuration.nix
  ];

  boot.initrd.kernelModules = ["virtio_gpu"];
  # spice client for clipboard sharing with host
  services.spice-vdagentd.enable = true;
}
