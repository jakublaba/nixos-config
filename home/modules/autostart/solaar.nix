{
  lib,
  config,
  ...
}: let
  cfg = config.my.home.autostart.solaar;
in {
  options.my.home.autostart.solaar.enable = lib.mkEnableOption "solaar-autostart";

  config = lib.mkIf cfg.enable {
    xdg.configFile."autostart/solaar.desktop".text = ''
      [Desktop Entry]
      Type=Application
      Name=Solaar
      Exec=solaar --window=hide
      Icon=solaar
      Terminal=false
    '';
  };
}
