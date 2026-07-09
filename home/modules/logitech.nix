{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.my.home.logitech;
in {
  options.my.home.logitech.enable = lib.mkEnableOption "logitech tools";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      solaar
      # though it's not logitech specific in general, I personally only use it as action ring
      kando
    ];
  };
}
