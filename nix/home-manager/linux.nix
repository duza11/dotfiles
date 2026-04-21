{
  inputs,
  pkgs,
  userName,
  ...
}:
{
  home = {
    username = userName;
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
