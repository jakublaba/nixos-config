{...}: {
  # normal vms
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["kuba"];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;

  # docker
  virtualisation.docker.enable = true;
  users.groups.docker.members = ["kuba"];
}
