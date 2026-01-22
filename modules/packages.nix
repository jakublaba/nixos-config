{pkgs, ...}: {
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    alejandra
    bat
    btop
    curl
    discord
    eza
    fastfetch
    filezilla
    gcc
    gtop
    ghostty
    gitui
    iotop
    jetbrains-toolbox
    mangohud
    nethogs
    obsidian
    obs-studio
    pciutils
    ppsspp
    python3
    ripgrep
    rustup
    solaar
    spotify
    tree
    uv
    vim
    vscode
    wget
    wirelesstools
  ];

  # todo figure out better organization
  # needed for solaar
  hardware.logitech.wireless.enable = true;

  programs = {
    firefox.enable = true;
    gamemode.enable = true;
    gnupg.agent = {
      enable = true;
      # don't like that this is coupled with de, but well
      pinentryPackage = pkgs.pinentry-gnome3;
    };
    steam.enable = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
}
