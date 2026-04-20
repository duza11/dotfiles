{
  inputs,
  config,
  pkgs,
  ...
}:
{
  home = {
    username = "duza";
    homeDirectory = "/Users/duza";
    packages = with pkgs; [
      zsh-completions
    ];
    file = {
      ".zshenv".source = ../../.zshenv;
    };
  };
  xdg.configFile = {
    karabiner = {
      source = ../../.config/karabiner;
      recursive = true;
    };
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
