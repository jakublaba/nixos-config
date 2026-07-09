{
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ./modules
  ];

  home.stateVersion = "26.05";

  my.home = {
    autostart = {
      corectrl.enable = true;
      kando.enable = true;
      solaar.enable = true;
    };
    dev = {
      git.enable = true;
      nix.enable = true;
      python.enable = true;
      rust.enable = true;
    };
    ghostty.enable = true;
    cli-tools.enable = true;
    logitech.enable = true;
  };

  home.packages = with pkgs; [
    # desktop apps
    discord
    filezilla
    obsidian
    spotify
    thunderbird
    zen-browser

    # editors/ides
    jetbrains.goland
    jetbrains.idea
    jetbrains.pycharm
    jetbrains.rust-rover
    vscode
  ];
}
