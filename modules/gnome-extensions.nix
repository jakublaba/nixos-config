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
        solaar-extension
        space-bar
        upower-battery
        user-themes
        removable-drive-menu
    ];
}
