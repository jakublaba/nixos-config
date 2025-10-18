{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.my.programs.gpg;
in {
  options.my.programs.gpg.enable = lib.mkEnableOption "gpg config";

  config = lib.mkIf cfg.enable {
    programs.gnupg.agent = {
      enable = true;
      pinentryPackage = pkgs.pinentry-gnome3;
    };
  };
}
