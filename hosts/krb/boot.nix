{ pkgs, ... }:

{
  boot = {
    loader = {
      grub = {
        enable = true;
        device = "/dev/nvme0n1";
        useOSProber = true;
      };

      timeout = 5;
    };

    kernelPackages = pkgs.linuxPackages_latest;
  };
}
