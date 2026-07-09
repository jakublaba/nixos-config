{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.my.home.cli-tools;
in {
  options.my.home.cli-tools.enable = lib.mkEnableOption "cli-tools";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      bat
      btop
      eza
      fastfetch
      ripgrep
    ];
  };
}
