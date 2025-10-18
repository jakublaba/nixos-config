{pkgs, ...}: {
  boot = {
    loader = {
      systemd-boot = {
        enable = true;
        configurationLimit = 5;
      };
      efi.canTouchEfiVariables = true;

      # spam space for systemd-boot menu
      timeout = 0;
    };

    kernelPackages = pkgs.linuxPackages_latest;
  };
}
