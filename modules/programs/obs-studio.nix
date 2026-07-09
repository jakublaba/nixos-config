{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg =
    config.my.programs.obs-studio;
in {
  options.my.programs.obs-studio.enable = lib.mkEnableOption "obs-studio";

  # enableVirtualCamera is not exposed in home manager context so keeping obs as system wide module
  config = lib.mkIf cfg.enable {
    programs.obs-studio = {
      enable = true;
      enableVirtualCamera = true;
    };
  };
}
