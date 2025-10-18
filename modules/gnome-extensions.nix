{ pkgs, ... }:

{
    environment.systemPackages = with pkgs.gnomeExtensions; [
        user-themes
        appindicator
        blur-my-shell
        dock-from-dash
        gnome-40-ui-improvements
        gsconnect
        space-bar
        upower-battery
        vitals
        removable-drive-menu
    ];
}
