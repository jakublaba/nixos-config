{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.my.programs.common;
in {
  options.my.programs.common.enable =
    lib.mkEnableOption "common packages";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      bat
      btop
      curl
      eza
      fastfetch
      pciutils
      ripgrep
      tree
      vim
      wget
      xdg-utils
    ];
  };
}
