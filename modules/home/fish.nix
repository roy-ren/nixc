{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
    '';

    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";

      j = "z";
      jnc = "j nixc";
      jnv = "j nvim";
      jd = "j dot-config";

      cIPhone = "nmcli c u 9e6dfef8-d1c3-4246-bb8d-22c10351cb5c";

      reload = "exec fish";

      g = "git";
      lg = "lazygit";
      v = "nvim";
      vi = "nvim";

      tm = "tmux";
    };

    shellAbbrs = {
      # ss
      ssu = {
        expansion = ''
          set -x http_proxy socks5h://127.0.0.1:1085;
          set -x https_proxy socks5h://127.0.0.1:1085;
        '';
        position = "command";
      };
      uss = {
        expansion = ''
          sudo ~/nixc/nixos/modules/networking/update.sh
          sudo systemctl restart ss
          systemctl status ss
        '';
        position = "command";
      };
      # NixOS 相关命令
      nl = {
        expansion = "nixos-rebuild list-generations";
        position = "command";
      };
      nfc = {
        expansion = "nix flake check --show-trace";
        position = "command";
      };
      ns = {
        expansion = "sudo nixos-rebuild switch --flake $FLAKE_PATH";
        position = "command";
      };
      nss = {
        expansion = "sudo nixos-rebuild switch --flake $FLAKE_PATH --show-trace";
        position = "command";
      };
      nso = {
        expansion = "sudo nixos-rebuild switch --flake $FLAKE_PATH --option substituters $SUBSTITUTERS";
        position = "command";
      };
      nsos = {
        expansion = "sudo nixos-rebuild switch --flake $FLAKE_PATH --option substituters $SUBSTITUTERS --show-trace";
        position = "command";
      };

      # 文件操作
      clearNvim = {
        expansion = "rm -rf ~/.local/state/nvim && rm -rf ~/.local/share/nvim";
        position = "command";
      };
    };
  };
}
