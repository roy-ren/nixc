{config, ...}: let
  dotfiles = "${config.home.homeDirectory}/nixc/modules/home/dotfiles";
  link = config.lib.file.mkOutOfStoreSymlink;
in {
  xdg = {
    enable = true;
    configFile = {
      "tmux".source = link "${dotfiles}/tmux";
      "nvim".source = link "${dotfiles}/nvim";
      "nushell".source = link "${dotfiles}/nushell";
      "lazygit".source = link "${dotfiles}/lazygit";
      "ghostty".source = link "${dotfiles}/ghostty";
      "starship.toml".source = link "${dotfiles}/starship.toml";
    };
  };
}
