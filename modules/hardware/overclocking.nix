{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.my.hardware.overclocking;
in {
  options.my.hardware.overclocking.enable = lib.mkEnableOption "overclocking";

  config = lib.mkIf cfg.enable {
    hardware.amdgpu.overdrive.enable = true;

    environment.systemPackages = with pkgs; [corectrl];

    security.polkit.enable = true;
    security.polkit.extraConfig = ''
      // allow corectrl to control gpu settings
      polkit.addRule(function(action, subject) {
        if (
          (action.id == "org.corectrl.helper.init" || action.id == "org.corectrl.helperkiller.init") &&
          subject.local == true &&
          subject.active == true &&
          subject.isInGroup("users")
        ) {
          return polkit.Result.YES;
        }
      });
    '';
  };
}
