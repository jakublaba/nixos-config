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
    cli-tools.enable = true;
    logitech.enable = true;
  };

  home.packages = with pkgs; [
    discord
    filezilla
    obsidian
    spotify
    thunderbird
    zen-browser
  ];
}
