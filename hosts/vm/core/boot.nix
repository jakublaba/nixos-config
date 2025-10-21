{pkgs, ...}: {
  boot = {
    loader = {
      grub = {
        enable = true;
        device = "/dev/vda";
        useOSProber = true;
      };

      timeout = 5;
    };

    kernelPackages = pkgs.linuxPackages_latest;
  };
}
