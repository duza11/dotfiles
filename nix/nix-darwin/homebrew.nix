{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "none";
    };
    taps = [ ];
    brews = [ ];
    casks = [
      "alt-tab"
      "ghostty"
      "google-chrome"
      "google-japanese-ime"
      "karabiner-elements"
      "obsidian"
      "raycast"
      "visual-studio-code"
    ];
  };
}
