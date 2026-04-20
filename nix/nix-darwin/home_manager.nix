{
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users."duza" = {
    imports = [
      ../home-manager/common.nix
      ../home-manager/darwin.nix
    ];
  };
}
