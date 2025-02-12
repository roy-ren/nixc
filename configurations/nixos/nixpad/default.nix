# See /modules/nixos/* for actual settings
# This file is just *top-level* configuration.
{
  pkgs,
  flake,
  ...
}: let
  inherit (flake) inputs;
  inherit (inputs) self;
  inherit (flake.config) me;
in {
  imports = [
    self.nixosModules.default
    self.nixosModules.gui
    self.nixosModules.input
    self.nixosModules.networking

    inputs.auto-cpufreq.nixosModules.default

    ./hardware
  ];

  boot.loader.systemd-boot.configurationLimit = 15;

  # Enable home-manager for our user
  home-manager.users."${me.username}" = {
    imports = [(self + /configurations/home/${me.username}.nix)];
  };

  # For home-manager to work.
  # https://github.com/nix-community/home-manager/issues/4026#issuecomment-1565487545
  users.users."${me.username}" = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = ["wheel" "networkmanager"];

    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICgiVRImgSj9zmeXtGgxsNyGY9HxCQgWKxIkdHS4mz4q royite.ren@gmail.com"
    ];
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = "24.11";
  time.timeZone = "Asia/Shanghai";
}
