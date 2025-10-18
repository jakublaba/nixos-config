{ pkgs, ... }:

{
    services.xserver = {
        displayManager.gdm.enable = true;
        desktopManager.gnome.enable = true;
    };

    # Debloat
    services.gnome.core-apps.enable = false;
    environment.gnome.excludePackages = with pkgs; [ gnome-tour ];

    environment.systemPackages = with pkgs; [ gnome-tweaks ];
}
