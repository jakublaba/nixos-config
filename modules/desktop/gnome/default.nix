{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.my.desktop.gnome;
in {
  imports = [
    ./default-apps.nix
    ./extensions.nix
  ];

  options.my.desktop.gnome.enable = lib.mkEnableOption "gnome";

  config = lib.mkIf cfg.enable {
    services = {
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };

    services.gnome.core-apps.enable = false;
    environment.gnome.excludePackages = [pkgs.gnome-tour];
  };
}
