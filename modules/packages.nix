{ pkgs, ... }:
{
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
    mangohud
    nethogs
    pciutils
    ripgrep
    tree
    vim
    vscode
    wget
    wirelesstools
  ];

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
