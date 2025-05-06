# See /modules/darwin/* for actual settings
# This file is just *top-level* configuration.
{
  flake,
  pkgs,
  ...
}: let
  inherit (flake) inputs;
  inherit (inputs) self;
  inherit (flake.config) me;
in {
  imports = [
    self.darwinModules.default
  ];

  nixpkgs.hostPlatform = "aarch64-darwin";
  networking.hostName = "lagoon";

  environment.shells = [
    pkgs.bashInteractive
    pkgs.zsh
  ];

  environment.variables = {
    XDG_CONFIG_HOME = "${"$HOME"}/.config";
    XDG_DATA_HOME = "${"$HOME"}/.local/share";
  };

  users.users."${me.username}" = {
    home = "/Users/${me.username}";
    shell = pkgs.zsh;
  };

  home-manager = {
    backupFileExtension = "nixos-unified-template-backup";
    users."${me.username}" = {
      imports = [(self + /configurations/home/${me.username}.nix)];
    };
  };

  system.stateVersion = 4;
}
