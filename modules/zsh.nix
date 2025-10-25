{pkgs, ...}: {
  environment.systemPackages = with pkgs; [thefuck];

  programs.zsh = {
    enable = true;

    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;

    interactiveShellInit = ''
      eval $(thefuck --alias)
    '';

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
      ls = "eza --icons";
      cat = "bat";
      grep = "rg";
      ff = "fastfetch";
    };
  };

  users.defaultUserShell = pkgs.zsh;
}
