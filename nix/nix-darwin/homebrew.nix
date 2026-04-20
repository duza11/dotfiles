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
