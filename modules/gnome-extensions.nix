{ pkgs, ... }:

{
    environment.systemPackages = with pkgs.gnomeExtensions; [
        appindicator
        astra-monitor
        blur-my-shell
        dock-from-dash
        gamemode-shell-extension
        gnome-40-ui-improvements
        gsconnect
        removable-drive-menu
        solaar-extension
        space-bar
        upower-battery
        user-themes
        wayland-or-x11
        weekly-commits
        wifi-qrcode
    ];
}
