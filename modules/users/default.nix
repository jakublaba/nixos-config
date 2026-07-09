{pkgs, ...}: {
  imports = [
    ./kuba.nix
  ];

  users.defaultUserShell = pkgs.zsh;
}
