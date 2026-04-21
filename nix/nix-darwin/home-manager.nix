{
  inputs,
  username,
  ...
}:
{
  # ホームディレクトリを指定
  users.users.duza.home = "/Users/${username}";

  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";

    extraSpecialArgs = { inherit inputs; };

    users.duza = {
      imports = [
        ../home-manager/common.nix
        ../home-manager/darwin.nix
      ];
    };
  };
}
