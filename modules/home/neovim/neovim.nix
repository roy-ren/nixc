{pkgs, ...}: {
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      # json
      vscode-langservers-extracted
      yaml-language-server

      # bash
      bash-language-server
      shfmt

      nodejs

      # nix
      alejandra
      nixd
      nixdoc

      # lua
      lua-language-server
      stylua

      # swift
      sourcekit-lsp
    ];
  };
}
