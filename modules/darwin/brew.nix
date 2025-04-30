{
  flake,
  config,
  ...
}: let
  inherit (flake.config) me;
  inherit (flake) inputs;
in {
  imports = [
    inputs.nix-homebrew.darwinModules.nix-homebrew
  ];

  nix-homebrew = {
    enable = true;
    enableRosetta = true;
    user = me.username;
    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
      "leoafarias/fvm" = inputs.homebrew-fvm;
      "daipeihust/tap" = inputs.homebrew-im;
      "laishulu/homebrew" = inputs.homebrew-macism;
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
      "cocoapods"
      "swift-format"
      "swiftlint"
      "fvm"
      "im-select"
      "macism"
    ];

    caskArgs.language = "zh-CN";
    casks = [
      "google-chrome"
      "ghostty"
      "raycast"
      # "rectangle"
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
      "font-source-sans-3"
      "font-maple-mono-nf"
      "font-maple-mono-nf-cn"
    ];

    masApps = {
      Xcode = 497799835;
      # dingding = 1435447041;
    };
  };
}
