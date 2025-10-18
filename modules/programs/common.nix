{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.my.programs.common;
in {
  options.my.programs.common.enable =
    lib.mkEnableOption "common packages";

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      bat
      btop
      clinfo
      curl
      eza
      fastfetch
      filezilla
      gtop
      iotop
      nethogs
      pciutils
      ripgrep
      tree
      vim
      vulkan-tools
      wget
      wirelesstools
    ];
  };
}
