{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.my.home.dev.zsh;
in {
  options.my.home.dev.zsh.enable = lib.mkEnableOption "zsh config";

  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;

      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      oh-my-zsh = {
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
  };
}
