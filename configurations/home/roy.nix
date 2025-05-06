{
  flake,
  pkgs,
  lib,
  ...
}: let
  inherit (flake) inputs;
  inherit (inputs) self;
  inherit (flake.config) me;
in {
  imports = [
    self.homeModules.default
  ];

  nix.package = lib.mkDefault pkgs.nix;

  home = {
    stateVersion = "24.11";
    username = me.username;
    homeDirectory = lib.mkDefault "/${
      if pkgs.stdenv.isDarwin
      then "Users"
      else "home"
    }/${me.username}";
  };
}
