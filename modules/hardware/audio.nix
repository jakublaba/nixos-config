{
  lib,
  config,
  ...
}: let
  cfg = config.my.hardware.audio;
in {
  options.my.hardware.audio.enable = lib.mkEnableOption "audio";

  config = lib.mkIf cfg.enable {
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      pulse.enable = true;
      jack.enable = true;
      wireplumber.enable = true;
    };
  };
}
