{
  inputs,
  userName,
  ...
}:
{
  # ホームディレクトリを指定
  users.users.duza.home = "/Users/${userName}";

  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;

    extraSpecialArgs = { inherit inputs; };

    users.duza = {
      imports = [
        ../home-manager/common.nix
        ../home-manager/darwin.nix
      ];
    };
  };
}
