{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.my.hardware.mx-master;
in {
  options.my.hardware.mx-master.enable = lib.mkEnableOption "mx master 4 config";

  config =
    lib.mkIf cfg.enable
    {
      hardware.logitech.wireless.enable = true;

      environment.systemPackages = with pkgs; [
        solaar
        kando
        logiops
        gnomeExtensions.kando-integration
        gnomeExtensions.solaar-extension
        xdg-utils
      ];

      services.udev.extraRules = ''
        ACTION=="add", SUBSYSTEM=="usb", ENV{ID_VENDOR_ID}=="046d", ENV{ID_MODEL_ID}=="c548", \
        TAG+="systemd", ENV{SYSTEMD_WANTS}+="logiops-restart.service"
      '';

      systemd.services.logiops-restart = {
        description = "Restart logiops after mouse reconnect to reload config";

        serviceConfig = {
          Type = "oneshot";
          ExecStart = "${pkgs.systemd}/bin/systemctl restart logiops.service";
        };
      };

      systemd.services.logiops = {
        description = "Logitech Configuration Daemon";

        wantedBy = ["multi-user.target"];

        after = [
          "systemd-udevd.service"
          "dbus.service"
        ];

        wants = [
          "systemd-udevd.service"
          "dbus.service"
        ];

        serviceConfig = {
          Type = "simple";
          ExecStart = "${pkgs.logiops}/bin/logid";

          Restart = "always";
          RestartSec = "1s";

          User = "root";
        };
      };

      environment.etc."logid.cfg".source = ./logid.cfg;
    };
}
