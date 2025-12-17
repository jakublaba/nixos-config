{pkgs, ...}: {
  programs.git = {
    enable = true;

    config = {
      user = {
        name = "jakublaba";
        email = "jakub.maciej.laba@gmail.com";
        signingkey = "50675893F83757DA402659C27055AA8D2F20C29B";
      };

      commit.gpgsign = true;
      gpg.program = "gpg";
      push.autosetupremote = true;

      alias = {
        l = "log --oneline";
        g = "log --graph --oneline";
        wd = "diff --word-diff";
      };
    };
  };
}
