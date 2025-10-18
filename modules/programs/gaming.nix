{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.my.programs.gaming;
in {
  options.my.programs.gaming.enable = lib.mkEnableOption "steam + mangohud mostly";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      goverlay
      mangohud
      wine
    ];

    programs.gamemode.enable = true;
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;

      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
  };
}
