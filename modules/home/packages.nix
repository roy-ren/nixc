{pkgs, ...}: {
  # Nix packages to install to $HOME
  #
  # Search for packages here: https://search.nixos.org/packages
  home.packages = with pkgs; [
    cmake
    clang
    flutter
    firefox
    # glxinfo
    lazygit
    neofetch
    pkg-config
    # gtk4
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

    # <--- LSP
    # Nix dev
    cachix
    nil # Nix language server
    nix-info
    nixpkgs-fmt

    # nix
    alejandra
    nixd
    nixdoc

    # json
    vscode-langservers-extracted
    yaml-language-server

    # bash
    bash-language-server
    shfmt

    yarn
    nodejs_latest

    # lua
    lua-language-server
    stylua
    luarocks
    tree-sitter
    latex2html
    latex2mathml
    tectonic
    tmux

    # swift
    sourcekit-lsp
    # --- LSP>
    # tmux

    # On ubuntu, we need this less for `man home-configuration.nix`'s pager to
    # work.
    # less

    # gui
    # blueberry
    # (mpv.override {scripts = [mpvScripts.mpris];})
    # d-spy
    # dolphin
    # kolourpaint
    # nautilus
    # icon-library
    # dconf-editor
    # qt5.qtimageformats
    # vlc
    # yad

    # theming tools
    # gradience
    # gnome-tweaks

    # hyprland
    # cliphist
    # fuzzel
    # grim
    # hyprpicker
    # tesseract
    # imagemagick
    # pavucontrol
    # playerctl
    # swappy
    # swaylock-effects
    # swayidle
    # slurp
    # swww
    # wayshot
    # wlsunset
    # wf-recorder
  ];

  # Programs natively supported by home-manager.
  # They can be configured in `programs.*` instead of using home.packages.
  programs = {
    bat.enable = true;
    btop.enable = true;
    fzf.enable = true;
    # ghostty.enable = true;
    # tmux.enable = true;
    jq.enable = true;
    starship.enable = true;
    tmate.enable = true;
    zoxide.enable = true;
    nushell.enable = true;
  };
}
