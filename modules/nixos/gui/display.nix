{
  lib,
  pkgs,
  config,
  ...
}: let
  # path = "${config.home.homeDirectory}/nixc/home/modules/ui/wallpapers";
  # cb1 = "${path}/cb-001.jpg";
  # wp = cb1;
  regreet = "${config.programs.regreet.package}/bin/regreet";
  hyprland = "${config.programs.hyprland.package}/bin/Hyprland";
  hyprConf = pkgs.writeText "greetd-hyprland-config" ''
    exec-once = ${regreet}; hyprctl dispatch exit
    misc {
        disable_hyprland_logo = true
        disable_splash_rendering = true
        disable_hyprland_qtutils_check = true
    }
  '';
in {
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  programs.regreet = {
    enable = true;
    # font = {
    #   size = 14;
    #   name = "FiraCode";
    # };
    cageArgs = ["-s" "-m" "last"];
    settings = {
      background = {
        # Path to the background image
        # path = "${wp}";

        # How the background image covers the screen if the aspect ratio doesn't match
        # Available values: "Fill", "Contain", "Cover", "ScaleDown"
        # Refer to: https://docs.gtk.org/gtk4/enum.ContentFit.html
        # NOTE: This is ignored if ReGreet isn't compiled with GTK v4.8 support.
        fit = "Contain";

        # The entries defined in this section will be passed to the session as environment variables when it is started
      };
      env = {
        # ENV_VARIABLE = "value";
      };
      GTK = {
        # Whether to use the dark theme
        application_prefer_dark_theme = true;

        # Cursor theme name
        cursor_theme_name = "Adwaita";

        # Font name and size
        font_name = lib.mkForce "FiraCode 14";

        # Icon theme name
        icon_theme_name = "Adwaita";

        # GTK theme name
        theme_name = "Adwaita";
      };
      commands = {
        # The command used to reboot the system
        reboot = ["systemctl" "reboot"];

        # The command used to shut down the system
        poweroff = ["systemctl" "poweroff"];

        # The command prefix for X11 sessions to start the X server
        x11_prefix = ["startx" "/usr/bin/env"];
      };
      appearance = {
        # The message that initially displays on startup
        greeting_msg = "Hi Roy, Welcome back!";
      };
      widget.clock = {
        # strftime format argument
        # See https://docs.rs/jiff/0.1.14/jiff/fmt/strtime/index.html#conversion-specifications
        format = "%a %H:%M";

        # How often to update the text
        resolution = "500ms";

        # Override system timezone (IANA Time Zone Database name, aka /etc/zoneinfo path)
        # Remove to use the system time zone.
        timezone = "Asia/Shanghai";

        # Ask GTK to make the label at least this wide. This helps keeps the parent element layout and width consistent.
        # Experiment with different widths, the interpretation of this value is entirely up to GTK.
        label_width = 150;
      };
    };
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${hyprland} --config ${hyprConf}";
        user = "greeter";
      };
    };
  };
}
