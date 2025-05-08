{
  programs = {
    zoxide = {
      enable = true;
      enableNushellIntegration = true;
    };

    nushell = {
      enable = true;
      configFile.source = ./dotfiles/nushell/custom/config.nu;
      envFile.source = ./dotfiles/nushell/custom/env.nu;
      settings = {
        show_banner = false;
      };
    };
  };
}
