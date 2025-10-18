{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.my.programs.desktop-apps;
in {
  options.my.programs.desktop-apps.enable = lib.mkEnableOption "desktop apps";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      brave
      discord
      obsidian
      spotify
      thunderbird
    ];

    programs.obs-studio = {
      enable = true;
      enableVirtualCamera = true;
    };
  };
}
