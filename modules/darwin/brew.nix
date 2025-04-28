{
  flake,
  config,
  ...
}: let
  inherit (flake.config) me;
  inherit (flake.inputs) nix-homebrew;
  inherit (flake.inputs) homebrew-core;
  inherit (flake.inputs) homebrew-cask;
  inherit (flake.inputs) homebrew-fvm;
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
      "leoafarias/fvm" = homebrew-fvm;
      # "leoafarias/fvm"
      # "laishulu/macism"
    };

    mutableTaps = true;
    autoMigrate = false;
  };

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = false;
      upgrade = false;
      cleanup = "zap";
    };

    taps = builtins.attrNames config.nix-homebrew.taps;

    brews = [
      "imagemagick"
      # iOS
      "cocoapods"
      "swift-format"
      "swiftlint"
      "fvm"
    ];

    caskArgs.language = "zh-CN";
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

    masApps = {
      Xcode = 497799835;
      # dingding = 1435447041;
    };
  };
}
