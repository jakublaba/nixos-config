{
  lib,
  config,
  pkgs,
  inputs,
  ...
}: let
  cfg = config.my.programs.gaming;
  pkgs-unstable = import inputs.nixpkgs-unstable {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
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

      extraCompatPackages = with pkgs-unstable; [
        proton-ge-bin
      ];
    };
  };
}
