{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.my.hardware.mx-master;
in {
  options.my.hardware.mx-master.enable =
    lib.mkEnableOption "mx master 4 config";

  config = lib.mkIf cfg.enable {
    hardware.logitech.wireless.enable = true;

    environment.etc."logid.cfg".source = ./logid.cfg;

    systemd.services.logiops = {
      description = "Logitech HID++ configuration daemon";

      wantedBy = [
        "multi-user.target"
      ];

      serviceConfig = {
        Type = "simple";

        ExecStart = "${pkgs.logiops}/bin/logid -c /etc/logid.cfg";

        Restart = "always";
        RestartSec = "2s";
      };
    };

    # hacky and ugly but idk what else to do
    # logiops seems to load config too early on mouse wake so only restart helps
    # note: this doesn't work on bolt receiver replug, only on mouse restart (turn off and on)
    # after replugging the bolt receiver, you have to manually restart the mouse for config to load
    systemd.services.logiops-wakeup-monitor = {
      description = "Restart logiops after Logitech mouse wake";

      wantedBy = [
        "multi-user.target"
      ];

      after = [
        "logiops.service"
      ];

      requires = [
        "logiops.service"
      ];

      serviceConfig = {
        Type = "simple";

        ExecStart = pkgs.writeShellScript "logiops-wakeup-monitor" ''
          ${pkgs.systemd}/bin/journalctl \
            -fu logiops.service \
            -o cat |
          while read line; do
            if echo "$line" | grep -q "woke up"; then
              sleep 1
              ${pkgs.systemd}/bin/systemctl restart logiops.service
            fi
          done
        '';

        Restart = "always";
        RestartSec = "5s";
      };
    };
  };
}
