{
  config,
  impurity,
  inputs,
  pkgs,
  ...
}: {
  xdg.configFile = let
    link = config.lib.file.mkOutOfStoreSymlink;
  in {
    "nvim".source = link ./nvim;
    "starship.toml".source = link ./starship.toml;
  };
}
