{pkgs, ...}: {
  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    git
    wl-clipboard
    shadowsocks-rust
    brightnessctl
    playerctl
    gtk4
    overskride
    firefox
  ];
}
