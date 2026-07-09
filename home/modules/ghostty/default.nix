{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.my.home.ghostty;
in {
  options.my.home.ghostty.enable = lib.mkEnableOption "ghostty";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      ghostty
    ];

    xdg.configFile."ghostty/config".source = ./config;
  };
}
