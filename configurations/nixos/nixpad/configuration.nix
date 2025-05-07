{
  flake,
  pkgs,
  ...
}: let
  inherit (flake.config) me;
in {
  imports = [
    ./hardware
    ./packages.nix
  ];

  #enable flakse
  nix.settings. experimental-features = [
    "nix-command"
    "flakes"
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    systemd-boot.configurationLimit = 12;
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
