x{
  description = "";
  inputs = {
    nixpkgs.url = "flake:nixpkgs/nixpkgs-unstable";
    home-manager.url = "flake:home-manager";
  };
  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      flakeContext = {
        inherit inputs;
      };
    in
    {
      homeConfigurations = {
        spencer = import ./homeConfigurations/spencer.nix flakeContext;
      };
      nixosConfigurations = {
        nixos = import ./nixosConfigurations/nixos.nix flakeContext;
      };
      nixosModules = {
        user-spencer = import ./nixosModules/user-spencer.nix flakeContext;
      };
    };
}
