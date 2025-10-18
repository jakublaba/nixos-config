{ pkgs, ... }:

{
    services.xserver = {
        enable = true;
        excludePackages = with pkgs; [ xterm ];
        # Enable touchpad support
        # libinput.enable = true;
    };
}
