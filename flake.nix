{
  description = "NixOS_btw";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
#    myrepo.url = "github:Sayokeoda/NixOS_btw-configuration";
  };

  outputs = { self, nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        ./hosts/laptop/hardware.nix
        ./hosts/laptop/default.nix

        home-manager.nixosModules.home-manager
      ];
    };
  };
}
