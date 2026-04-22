{
  inputs,
  username,
  ...
}:
{
  # ホームディレクトリを指定
  users.users.${username}.home = "/Users/${username}";

  imports = [
    inputs.home-manager.darwinModules.home-manager
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    backupFileExtension = "backup";

    extraSpecialArgs = { inherit inputs; };

    users.${username} = {
      imports = [
        ../home-manager/common.nix
        ../home-manager/darwin.nix
      ];
    };
  };
}
