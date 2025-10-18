{ pkgs, ... }:

{
    boot.initrd.kernelModules = [
        "virtio_gpu"
        # "amdgpu"
    ];

    hardware = {
        # amdgpu.overdrive.enable = true;
        graphics = {
            enable = true;
            enable32Bit = true;
            extraPackages = with pkgs; [
                mesa
                vulkan-loader
                vulkan-tools
            ];
        };
    };

    # services.xserver.videoDrivers = [ "amdgpu" ];

    environment.systemPackages = with pkgs; [ lact ];

    systemd.packages = with pkgs; [ lact ];
    systemd.services.lactd.wantedBy = [ "multi-user.target" ];
}
