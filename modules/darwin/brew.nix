{flake, ...}: let
  inherit (flake.inputs) nix-homebrew;
  inherit (flake.inputs) homebrew-core;
  inherit (flake.inputs) homebrew-cask;
in {
  imports = [
    nix-homebrew.darwinModules.nix-homebrew
  ];

  homebrew = {
    enable = true;
    caskArgs.language = "zh-CN";

    brews = [
      "imagemagick"
      # iOS
      "cocoapods"
      "swift-format"
      "swiftlint"
    ];

    casks = [
      "google-chrome"
      "ghostty"
      "raycast"
      "rectangle"
      "proxyman"
      "xcodes"
      "input-source-pro"
      "chatgpt"
      "shadowsocksx-ng"
      "karabiner-elements"
      # fonts
      "font-fira-code"
      "font-fira-code-nerd-font"
      "font-droid-sans-mono-nerd-font"
      "font-hack-nerd-font"
    ];

    taps = [
      # "leoafarias/fvm"
    ];

    masApps = {
      Xcode = 497799835;
      # dingding = 1435447041;
    };
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
