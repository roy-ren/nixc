# This is your nix-darwin configuration.
# For home configuration, see /modules/home/*
{
  flake,
  pkgs,
  ...
}: let
  inherit (flake.config) me;
in {
  imports = [
    ./brew.nix
    ./service.nix
    ./system.nix
  ];

  nix.settings.trusted-users = ["root" me.username];
  nix.enable = false;

  environment.systemPackages = with pkgs; [nix];
}
