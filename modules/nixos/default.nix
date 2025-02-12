# This is your nixos configuration.
# For home configuration, see /modules/home/*
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
  nix.settings = {
    #enable flakse
    experimental-features = [
      "nix-command"
      "flakes"
    ];

    # These users can add Nix caches.
    trusted-users = [
      "root"
      me.username
    ];
  };

  services.openssh.enable = true;
  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    git
    vim
    wl-clipboard
    shadowsocks-rust
    brightnessctl
    playerctl
  ];
}
