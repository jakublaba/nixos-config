{ pkgs, ... }:

{
    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [
      bat
      btop
      curl
      eza
      fastfetch
      ghostty
      gitui
      goverlay
      mangohud
      mission-center
      ripgrep
      thefuck
      tree
      vim
      vscode
      wget
    ];

    programs = {
      firefox.enable = true;
      steam.enable = true;
      zsh.enable = true;
    };

    # Some programs need SUID wrappers, can be configured further or are
    # started in user sessions.
    # programs.mtr.enable = true; 
    # programs.gnupg.agent = {
    #   enable = true;
    #   enableSSHSupport = true;
    # };
}
