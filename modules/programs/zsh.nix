{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.my.programs.zsh;
in {
  options.my.programs.zsh.enable = lib.mkEnableOption "zsh config";

  config = lib.mkIf cfg.enable {
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
        ls = "eza --icons";
        cat = "bat";
        grep = "rg";
        ff = "fastfetch";
      };
    };

    users.defaultUserShell = pkgs.zsh;
  };
}
