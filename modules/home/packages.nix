{pkgs, ...}: {
  # Nix packages to install to $HOME
  #
  # Search for packages here: https://search.nixos.org/packages
  home.packages = with pkgs; [
    cmake
    clang
    flutter
    firefox
    glxinfo
    lazygit
    neofetch
    pkg-config
    gtk4
    ninja
    unzip
    zip
    just

    # Unix tools
    ripgrep # Better `grep`
    fd
    sd
    tree
    gnumake

    # Nix dev
    cachix
    nil # Nix language server
    nix-info
    nixpkgs-fmt

    # On ubuntu, we need this less for `man home-configuration.nix`'s pager to
    # work.
    less

    # gui
    blueberry
    (mpv.override {scripts = [mpvScripts.mpris];})
    d-spy
    dolphin
    kolourpaint
    nautilus
    icon-library
    dconf-editor
    qt5.qtimageformats
    vlc
    yad

    # theming tools
    gradience
    gnome-tweaks

    # hyprland
    cliphist
    fuzzel
    grim
    hyprpicker
    tesseract
    imagemagick
    pavucontrol
    playerctl
    swappy
    swaylock-effects
    swayidle
    slurp
    swww
    wayshot
    wlsunset
    wf-recorder
  ];

  # Programs natively supported by home-manager.
  # They can be configured in `programs.*` instead of using home.packages.
  programs = {
    # Better `cat`
    bat.enable = true;
    # Install btop https://github.com/aristocratos/btop
    btop.enable = true;

    fzf.enable = true;

    ghostty.enable = true;

    jq.enable = true;

    # Type `<ctrl> + r` to fuzzy search your shell history
    starship = {
      enable = true;
    };

    # Tmate terminal sharing.
    tmate = {
      enable = true;

      #host = ""; #In case you wish to use a server other than tmate.io
    };

    zoxide.enable = true;
  };
}
