{flake, ...}: let
  inherit (flake.config) me;
in {
  home.shellAliases = {
    g = "git";
    lg = "lazygit";
  };

  # https://nixos.asia/en/git
  programs = {
    git = {
      enable = true;
      userName = me.fullname;
      userEmail = me.email;
      ignores = ["*~" "*.swp"];
      aliases = {
        cb = "checkout -b";
        cm = "commit";
        ca = "commit --amend";
      };

      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = "false";
      };
    };
    lazygit.enable = true;
  };
}
