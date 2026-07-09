{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.my.home.dev.nix;
in {
  options.my.home.dev.nix.enable = lib.mkEnableOption "nix";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      alejandra
    ];
  };
}
