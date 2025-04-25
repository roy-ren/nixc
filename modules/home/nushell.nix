{
  programs.nushell = {
    enable = true;

    settings = {
      show_banner = false;
    };

    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
      "...." = "cd ../../..";
      "....." = "cd ../../../..";

      cc = "nmcli -p c u 9e6dfef8-d1c3-4246-bb8d-22c10351cb5c";

      j = "just";
      jr = "just run";

      g = "git";
      lg = "lazygit";
      v = "nvim";
      vi = "nvim";

      la = "ls -a";
      ll = "ls -l";
      lla = "ls -l -a";

      t = "tmux";
      ta = "tmux attach";

      nix-his = "nix profile history --profile /nix/var/nix/profiles/system";

      # 清理历史版本并不会删除数据，还需要以 root 身份运行 gc 命令来删除所有未使用的包
      # 因为如下 issue，还需要以当前用户身份运行 gc 命令来删除 home-manager 的历史版本和包
      # https://github.com/NixOS/nix/issues/8508
      nixgc = "nix-collect-garbage --delete-old";

      # 清理 7 天之前的所有历史版本
      nix-wipe7 = "sudo nix profile wipe-history --older-than 7d --profile /nix/var/nix/profiles/system";
    };

    #  extraConfig = ''
    #       # File operations
    #       def clearNvim {
    # rm -rf ~/.local/state/nvim; rm -rf ~/.local/share/nvim
    #       }
    #
    #       # ============================================= #
    #       # Abbreviations (Shortcuts)                    #
    #       # --------------------------------------------- #
    #       def ssu {
    #           set-env http_proxy "socks5h://127.0.0.1:1085"
    #           set-env https_proxy "socks5h://127.0.0.1:1085"
    #       }
    #
    #       def uss {
    #           sudo ~/nixc/nixos/modules/networking/update.sh
    #           sudo systemctl restart ss
    #           systemctl status ss
    #       }
    #  '';
  };
}
