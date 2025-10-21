{...}: {
  imports = [
    # less hassle to just build in impure mode than copy hardware config on vms each time
    /etc/nixos/hardware-configuration.nix
    ./boot.nix
  ];

  boot.initrd.kernelModules = ["virtio_gpu"];
  # spice client for clipboard sharing with host
  services.spice-vdagentd.enable = true;
}
