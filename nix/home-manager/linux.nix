{
  pkgs,
  username,
  ...
}:
let
  mkConfig = import ../utils/mkConfig.nix;
in
{
  home = {
    inherit username;
    homeDirectory = "/home/${username}";
    packages = with pkgs; [
      blesh
    ];
    file = {
    };
  };
  xdg.configFile = {
    blesh = mkConfig "blesh";
  };
  programs = {
    bash = {
      enable = true;
      initExtra = ''
        source ${pkgs.git}/share/git/contrib/completion/git-prompt.sh
        GIT_PS1_SHOWDIRTYSTATE=1
        source -- "$(blesh-share)"/ble.sh
      ''
      + builtins.readFile ../../.bashrc;
      enableCompletion = true;
    };
  };
}
