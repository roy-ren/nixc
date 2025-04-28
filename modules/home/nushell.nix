{
  programs.nushell = {
    enable = true;
    configFile.source = ./dotfiles/nushell/config.nu;
    envFile.source = ./dotfiles/nushell/env.nu;
  };
}
