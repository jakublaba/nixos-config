{
  lib,
  config,
  ...
}: let
  cfg = config.my.home.autostart.kando;
in {
  options.my.home.autostart.kando.enable = lib.mkEnableOption "kando-autostart";

  config = lib.mkIf cfg.enable {
    xdg.configFile."autostart/kando.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=Kando
      Exec=kando
      Icon=kando
      Terminal=false
      StartupNotify=False
    '';
  };
}
