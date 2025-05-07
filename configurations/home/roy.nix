{
  flake,
  pkgs,
  lib,
  config,
  ...
}: let
  inherit (flake) inputs;
  inherit (inputs) self;
  inherit (flake.config) me;
in {
  imports = [
    self.homeModules.default
  ];
  # ++ (
  #   if pkgs.stdenv.isLinux
  #   then self.nixosModules.hypr
  #   else []
  # );

  nix.package = lib.mkDefault pkgs.nix;

  home = {
    packages =
      if pkgs.stdenv.isLinux
      then [config.nix.package]
      else [];

    stateVersion = "24.11";
    username = me.username;
    homeDirectory = lib.mkDefault "/${
      if pkgs.stdenv.isDarwin
      then "Users"
      else "home"
    }/${me.username}";
  };
}
