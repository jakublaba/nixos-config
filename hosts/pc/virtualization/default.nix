{...}: {
  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["kuba"];
  virtualisation.libvirtd.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
}
