{pkgs, ...}: {
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
}
