{inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./home-manager.nix
    ./modules

    inputs.home-manager.nixosModules.home-manager
  ];

  my.desktop = {
    gnome = {
      enable = true;
      default-apps.enable = true;
    };
  };

  my.hardware = {
    audio.enable = true;
    gpu.enable = true;
    overclocking.enable = true;
    virtualization.enable = true;

    mx-master.enable = true;
  };

  my.programs = {
    common.enable = true;
    desktop-apps.enable = true;
    devtools.enable = true;
    direnv.enable = true;
    gaming.enable = true;
    git.enable = true;
    gpg.enable = true;
    nix-ld.enable = true;
    zsh.enable = true;
  };
}
