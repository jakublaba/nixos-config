{pkgs, ...}: {
  imports = [
    ./apps.nix
    ./extensions.nix
  ];

  services = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  services.gnome.core-apps.enable = false;
  environment.gnome.excludePackages = [pkgs.gnome-tour];
}
