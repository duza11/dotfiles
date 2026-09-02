{
  description = "Home Manager configuration of duza";

  inputs = {
    # Specify the source of Home Manager and Nixpkgs.
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
    herdr = {
      url = "github:herdrdev/herdr/v0.8.2";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    riot-v3-language-server.url = "github:duza11/riot-v3-language-server";
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
      linuxUserName = builtins.getEnv "USER";
    in
    {
      homeConfigurations.${linuxUserName} = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs { system = "x86_64-linux"; };
        extraSpecialArgs = {
          inherit inputs;
          username = linuxUserName;
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
