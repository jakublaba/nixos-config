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
    gtop
    ghostty
    gitui
    iotop
    jetbrains.idea-ultimate
    jetbrains.pycharm-professional
    mangohud
    nethogs
    obsidian
    pciutils
    python3
    ripgrep
    solaar
    spotify
    tree
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
