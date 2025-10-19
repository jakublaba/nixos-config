{ pkgs, ... }:

{
    hardware = {
        graphics = {
            enable = true;
            enable32Bit = true;
            extraPackages = with pkgs; [
                libdrm
                mesa
                vulkan-loader
                vulkan-tools
            ];
        };
    };
}
