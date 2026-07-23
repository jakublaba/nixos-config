{
  lib,
  config,
  ...
}: let
  cfg = config.my.home.autostart.corectrl;
in {
  options.my.home.autostart.corectrl.enable = lib.mkEnableOption "corectrl-autostart";

  config = lib.mkIf cfg.enable {
    xdg.configFile."autostart/corectrl.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=CoreCtrl
      Exec=corectrl --minimize-systray
      Icon=corectrl
      Terminal=false
      StartupNotify=false
    '';
  };
}
