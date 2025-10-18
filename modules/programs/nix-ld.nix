{
  lib,
  config,
  ...
}: let
  cfg = config.my.programs.nix-ld;
in {
  options.my.programs.nix-ld.enable =
    lib.mkEnableOption "nix-ld";

  config = lib.mkIf cfg.enable {
    programs.nix-ld.enable = true;
  };
}
