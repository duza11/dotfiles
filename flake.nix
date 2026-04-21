{
  description = "Home Manager configuration of duza";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    vim-overlay.url = "github:kawarimidoll/vim-overlay";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      nix-darwin,
      ...
    }@inputs:
    let
      linuxSystem = "x86_64-linux";
      darwinSystem = "aarch64-darwin";

      linux_username = builtins.getEnv "USER";

      mkPkgs = system: import nixpkgs { inherit system; };

      pkgsLinux = mkPkgs linuxSystem;
      pkgsDarwin = mkPkgs darwinSystem;
    in
    {
      formatter.${linuxSystem} = pkgsLinux.nixfmt;
      formatter.${darwinSystem} = pkgsDarwin.nixfmt;
      homeConfigurations.${linux_username} = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgsLinux;
        extraSpecialArgs = {
          inherit inputs;
          username = linux_username;
        };
        modules = [
          ./nix/home-manager/common.nix
          ./nix/home-manager/linux.nix
        ];
      };
      darwinConfigurations.d-darwin = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = {
          inherit self inputs;
          username = "duza";
        };
        modules = [
          ./nix/nix-darwin/default.nix
        ];
      };
    };
}
