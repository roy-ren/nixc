{config, ...}: {
  xdg.configFile = let
    dotfiles = "${config.home.homeDirectory}/nixc/modules/home/dotfiles";
    link = config.lib.file.mkOutOfStoreSymlink;
  in {
    "ghostty".source = link "${dotfiles}/ghostty";
    "nushell/aliases.nu".source = link "${dotfiles}/nushell/aliases.nu";
    "nvim".source = link "${dotfiles}/nvim";
    "tmux".source = link "${dotfiles}/tmux";
    "lazygit".source = link "${dotfiles}/lazygit";
    "starship.toml".source = link "${dotfiles}/starship.toml";
  };
}
