{
  inputs,
  config,
  pkgs,
  ...
}:
let
  mkConfig = import ../utils/mkConfig.nix;
in
{
  home = {
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      zsh-completions
    ];
    file = {
      ".zshenv".source = ../../.zshenv;
    };
  };
  xdg.configFile = {
    ghostty = mkConfig "ghostty";
    karabiner = mkConfig "karabiner";
  };
  programs = {
    zsh = {
      enable = true;
      dotDir = "${config.xdg.configHome}/zsh";
      initContent = builtins.readFile ../../.config/zsh/.zshrc;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
    };
  };
}
