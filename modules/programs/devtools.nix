{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.my.programs.devtools;
in {
  options.my.programs.devtools.enable = lib.mkEnableOption "compilers, linters, editors, etc.";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      gcc
      go
      python3
      rustup
      uv

      alejandra
      gitui
    ];
  };
}
