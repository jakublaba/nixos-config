{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: let
  cfg = config.my.home.cli-tools;
  pkgs-unstable = import inputs.nixpkgs-unstable {
    system = pkgs.stdenv.hostPlatform.system;
  };
in {
  options.my.home.cli-tools.enable = lib.mkEnableOption "cli-tools";

  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      bat
      btop
      eza
      fastfetch
      pkgs-unstable.fetch
      ripgrep
    ];
  };
}
