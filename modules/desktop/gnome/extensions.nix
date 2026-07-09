{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    gnomeExtensions.alphabetical-app-grid
    gnomeExtensions.appindicator
    gnomeExtensions.astra-monitor
    gnomeExtensions.blur-my-shell
    gnomeExtensions.dock-from-dash
    gnomeExtensions.gamemode-shell-extension
    gnomeExtensions.gnome-40-ui-improvements
    gnomeExtensions.gsconnect
    gnomeExtensions.kando-integration
    gnomeExtensions.removable-drive-menu
    gnomeExtensions.solaar-extension
    gnomeExtensions.space-bar
    gnomeExtensions.upower-battery
    gnomeExtensions.user-themes
    gnomeExtensions.wayland-or-x11
    gnomeExtensions.weekly-commits
    gnomeExtensions.wifi-qrcode

    # astra-monitor dependencies
    amdgpu_top
    clinfo
    gtop
    iotop
    nethogs
    wirelesstools
  ];

  programs.kdeconnect = {
    enable = true;
    package = pkgs.gnomeExtensions.gsconnect;
  };
}
