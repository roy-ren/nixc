{flake, ...}: let
  inherit (flake.inputs) nix-homebrew;
  inherit (flake.inputs) homebrew-core;
  inherit (flake.inputs) homebrew-cask;
in {
  imports = [
    nix-homebrew.darwinModules.nix-homebrew
  ];

  homebrew.enable = true;
  homebrew.brews = [
    "imagemagick"
  ];
  homebrew.caskArgs.language = "zh-CN";
  homebrew.casks = [
    "google-chrome"
    "ghostty"
  ];
  homebrew.masApps = {
    # Xcode = 497799835;
  };

  nix-homebrew = {
    # Install Homebrew under the default prefix
    enable = true;

    # Apple Silicon Only: Also install Homebrew under the default Intel prefix for Rosetta 2
    enableRosetta = true;

    # User owning the Homebrew prefix
    user = "roy";

    # Optional: Declarative tap management
    taps = {
      "homebrew/homebrew-core" = homebrew-core;
      "homebrew/homebrew-cask" = homebrew-cask;
    };

    # Optional: Enable fully-declarative tap management
    #
    # With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`.
    mutableTaps = false;
  };
}
