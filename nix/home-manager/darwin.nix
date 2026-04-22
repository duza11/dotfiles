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
      zsh-completions
    ];
    file = {
      ".zshenv".source = ../../.zshenv;
    };
  };
  xdg.configFile = {
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
