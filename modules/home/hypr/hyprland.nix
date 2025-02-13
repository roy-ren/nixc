{ flake
, pkgs
, ...
}:
let
  inherit (flake) inputs;
  system = pkgs.stdenv.hostPlatform.system;
  hPkgs = inputs.hyprland.packages.${system};
in
{
  wayland.windowManager.hyprland.systemd.enable = false;

  wayland.windowManager.hyprland.enable = true;
  wayland.windowManager.hyprland.package = hPkgs.hyprland;

  # wayland.windowManager.hyprland.plugins = with plugins; [
  #   hyprbars
  # ];

  wayland.windowManager.hyprland.settings = {
    "$mod" = "SUPER";

    exec = "waybar && hyprpaper";

    windowrule = "pseudo, fcitx";
    exec-once = "fcitx5 -d -r & fcitx5-remote -r";

    general = {
      gaps_in = 0;
      gaps_out = 0;
      border_size = 0;

      layout = "dwindle";
    };

    input = {
      kb_options = "altwin:swap_alt_win";
      repeat_rate = 50;
      repeat_delay = 300;
      touchpad = {
        natural_scroll = true;
      };
    };

    bind =
      [
        "$mod, F, exec, firefox"
        "$mod SHIFT, Q, killactive,"
        "SHIFT, escape, exec, ghostty"
        "Control_L ALT, F, fullscreen,"
        ", XF86MonBrightnessUp, exec, brightnessctl set +5%"
        ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"
        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioNext, exec, playerctl next"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (builtins.genList
          (
            i:
            let
              ws = i + 1;
            in
            [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          )
          9)
      );
  };
}
