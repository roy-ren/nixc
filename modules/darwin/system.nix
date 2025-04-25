{...}: {
  # Configure macOS system
  # More lagoons => https://github.com/ryan4yin/nix-darwin-kickstarter/blob/main/rich-demo/modules/system.nix
  system = {
    defaults = {
      dock = {
        autohide = true;
        orientation = "left";
        show-process-indicators = false;
        show-recents = false;
        # customize Hot Corners
        wvous-tl-corner = 2; # top-left - Mission Control
        wvous-tr-corner = 13; # top-right - Lock Screen
        wvous-bl-corner = 3; # bottom-left - Application Windows
        wvous-br-corner = 4; # bottom-right - Desktop
      };
      trackpad = {
        Clicking = true;
        TrackpadThreeFingerDrag = true;
      };

      finder = {
        _FXShowPosixPathInTitle = true; # show full path in finder title
        AppleShowAllExtensions = true; # show all file extensions
        FXEnableExtensionChangeWarning = false; # disable warning when changing file extension
        QuitMenuItem = true; # enable quit menu item
        ShowPathbar = true; # show path bar
        ShowStatusBar = true; # show status bar
        ShowExternalHardDrivesOnDesktop = true;
        # ShowHardDrivesOnDesktop = true;
        ShowRemovableMediaOnDesktop = true;
      };

      loginwindow = {
        GuestEnabled = false;
        LoginwindowText = "Hey Man!";
        PowerOffDisabledWhileLoggedIn = true;
        # RestartDisabled = true;
        RestartDisabledWhileLoggedIn = true;
        SHOWFULLNAME = true;
        ShutDownDisabled = true;
        ShutDownDisabledWhileLoggedIn = true;
      };

      screencapture = {
        target = "clipboard";
      };

      # smb.ServerDescription = "lagoon";

      CustomSystemPreferences = {
      };
      CustomUserPreferences = {
      };
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        AppleShowAllExtensions = true;
        InitialKeyRepeat = 15;
        KeyRepeat = 2;
        AppleFontSmoothing = 1;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSTableViewDefaultSizeMode = 1;
        AppleEnableSwipeNavigateWithScrolls = true; # 启用三指拖移功能
      };
    };

    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
      userKeyMapping = [
        {
          HIDKeyboardModifierMappingSrc = 30064771129;
          HIDKeyboardModifierMappingDst = 30064771296;
        }
        {
          HIDKeyboardModifierMappingSrc = 30064771114;
          HIDKeyboardModifierMappingDst = 30064771121;
        }
        {
          HIDKeyboardModifierMappingSrc = 30064771121;
          HIDKeyboardModifierMappingDst = 30064771114;
        }
      ];
    };
  };
}
