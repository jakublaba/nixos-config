{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.my.desktop.gnome.default-apps;
in {
  options.my.desktop.gnome.default-apps.enable = lib.mkEnableOption "minimal default gnome app suite";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      adwaita-icon-theme
      authenticator
      evince
      gnome-calculator
      gnome-calendar
      gnome-clocks
      gnome-console
      gnome-text-editor
      gnome-themes-extra
      gnome-tweaks
      loupe
      nautilus
      showtime
    ];
  };
}
