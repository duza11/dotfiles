{
  inputs,
  pkgs,
  username,
  ...
}:
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
  };
}
