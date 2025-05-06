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

  nix = {
    enable = false;
    settings.trusted-users = [
      "root"
      me.username
    ];
  };

  environment.systemPackages = with pkgs; [nix];
}
