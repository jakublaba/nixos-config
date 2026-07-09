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
      curl
      pciutils
      tree
      vim
      wget
      xdg-utils
    ];

    programs.zsh.enable = true;
  };
}
