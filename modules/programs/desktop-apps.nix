{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: let
  cfg = config.my.programs.desktop-apps;
in {
  options.my.programs.desktop-apps.enable = lib.mkEnableOption "desktop apps";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      discord
      filezilla
      obsidian
      spotify
      thunderbird
      inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];

    programs.obs-studio = {
      enable = true;
      enableVirtualCamera = true;
    };
  };
}
