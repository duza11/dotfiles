{
  system = {
    defaults = {
      NSGlobalDomain = {
        AppleInterfaceStyle = "Dark";
        AppleShowAllFiles = true;
        AppleShowAllExtensions = true;
        InitialKeyRepeat = 15;
        KeyRepeat = 2;
        NSWindowResizeTime = 0.001;
      };
      finder = {
        AppleShowAllFiles = true;
        AppleShowAllExtensions = true;
        FXPreferredViewStyle = "Nlsv";
        _FXShowPosixPathInTitle = true;
      };
      dock = {
        autohide = true;
        show-recents = false;
        mineffect = "scale";
        orientation = "left";
        wvous-bl-corner = 1;
        wvous-br-corner = 4;
        wvous-tl-corner = 1;
        wvous-tr-corner = 1;
      };
      trackpad = {
        Clicking = true;
        TrackpadCornerSecondaryClick = 2;
        TrackpadRightClick = false;
      };
      ".GlobalPreferences" = {
        "com.apple.mouse.scaling" = 8.0;
      };
    };
  };
  security.pam.services.sudo_local.touchIdAuth = true;
}
