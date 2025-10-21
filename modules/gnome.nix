{ pkgs, ... }:
{
  services.xserver = {
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  # Debloat
  services.gnome.core-apps.enable = false;
  environment.gnome.excludePackages = with pkgs; [ gnome-tour ];

  # If coming from another DE, still need to set cursor theme
  # gsettings set org.gnome.desktop.interface cursor-theme <cursor-theme>
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    authenticator
    evince
    gnome-calendar
    gnome-console
    gnome-themes-extra
    gnome-tweaks
    nautilus
  ];
}
