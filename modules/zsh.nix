{ pkgs, ... }:

{
  programs.zsh = {
    enable = true;

    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    ohMyZsh = {
      enable = true;
      theme = "trapd00r";

      plugins = [
        "git"
        "colored-man-pages"
      ];
    };

    shellAliases = {
      cls = "clear";
      x = "exit";
      ls = "eza";
      cat = "bat";
      grep = "rg";
      ff = "fastfetch";
    };
  };

  users.defaultUserShell = pkgs.zsh;
}
