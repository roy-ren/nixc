{
  description = "A home-manager template providing useful tools & settings for Nix-based development";

  nixConfig.substituters = [
    "https://mirrors.tuna.tsinghua.edu.cn/nix-channels/store"
    "https://cache.nixos.org"
  ];

  inputs = {
    # Principle inputs (updated by `nix run .#update`)

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts.url = "github:hercules-ci/flake-parts";
    nixos-unified.url = "github:srid/nixos-unified";

    # Software inputs
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ####################################################
    # lagoon
    ####################################################
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    # Optional: Declarative tap management
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    homebrew-fvm = {
      url = "github:leoafarias/fvm";
      flake = false;
    };
    homebrew-im = {
      url = "github:daipeihust/im-select";
      flake = false;
    };
    homebrew-macism = {
      url = "github:laishulu/macism";
      flake = false;
    };

    ####################################################
    # nixpad
    ####################################################
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.nixpkgs.follows = "hyprland";
    };
    stylix.url = "github:danth/stylix";

    # ThinkPad X1 Carbon hardware
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    auto-cpufreq = {
      url = "github:AdnanHodzic/auto-cpufreq";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    ####################################################
  };

  # Wired using https://nixos-unified.org/autowiring.html
  outputs = inputs:
    inputs.nixos-unified.lib.mkFlake
    {
      inherit inputs;
      root = ./.;
    };
}
