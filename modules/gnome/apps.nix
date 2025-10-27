{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    adwaita-icon-theme
    authenticator
    evince
    gnome-calendar
    gnome-clocks
    gnome-console
    gnome-themes-extra
    gnome-tweaks
    loupe
    nautilus
  ];
}
