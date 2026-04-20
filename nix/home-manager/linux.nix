{
  inputs,
  pkgs,
  ...
}:
{
  home = {
    #username = "duza";
    #homeDirectory = "/home/duza";
    packages = with pkgs; [
      blesh
    ];
    file = {
    };
  };
  xdg.configFile = {
  };
}
