{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.my.home.dev.python;
in {
  options.my.home.dev.python.enable = lib.mkEnableOption "python";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      uv
    ];
  };
}
