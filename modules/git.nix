{ pkgs, ... }:
{
  programs.git = {
    enable = true;

    config = {
      user = {
        name = "jakublaba";
        email = "jakub.maciej.laba@gmail.com";
      };

      push.autosetupremote = true;

      alias = {
        l = "log --oneline";
        g = "log --graph --oneline";
        wd = "diff --word-diff";
      };
    };
  };
}
