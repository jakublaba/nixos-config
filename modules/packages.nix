{ pkgs, ... }:

{
    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
      amdgpu_top
      bat
      btop
      curl
      discord
      eza
      fastfetch
      gtop
      ghostty
      gitui
      iotop
      mangohud
      mission-center
      nethogs
      pciutils
      ripgrep
      thefuck
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
