{
  inputs,
  pkgs,
  userName,
  ...
}:
{
  home = {
    inherit userName;
    homeDirectory = "/home/${userName}";
    packages = with pkgs; [
      blesh
    ];
    file = {
    };
  };
  xdg.configFile = {
  };
}
