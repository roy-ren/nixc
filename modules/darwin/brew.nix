{flake, ...}: let
  inherit (flake.config) me;
  inherit (flake.inputs) nix-homebrew;
  inherit (flake.inputs) homebrew-core;
  inherit (flake.inputs) homebrew-cask;
  inherit (flake.inputs) leoafarias-taps;
in {
  imports = [
    nix-homebrew.darwinModules.nix-homebrew
  ];

  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = me.username;
    taps = {
      "homebrew/homebrew-core" = homebrew-core;
      "homebrew/homebrew-cask" = homebrew-cask;
      "homebrew/homebrew-fvm" = leoafarias-taps;
    };

    mutableTaps = false;
    autoMigrate = true;
  };

  homebrew = {
    enable = true;
    caskArgs.language = "zh-CN";

    brews = [
      "imagemagick"
      # iOS
      "cocoapods"
      "swift-format"
      "swiftlint"
      # "fvm"
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
      # "laishulu/macism"
    ];

    masApps = {
      Xcode = 497799835;
      # dingding = 1435447041;
    };
  };
}
