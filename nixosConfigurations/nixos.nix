{ inputs, ... }@flakeContext:
let
  nixosModule = { config, lib, pkgs, ... }: {
    imports = [
      inputs.home-manager.nixosModules.home-manager
      inputs.self.nixosModules.user-spencer
      {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
      }
    ];
    config = {
      environment = {
        systemPackages = [
          pkgs.sl
        ];
      };
      fileSystems = {
        "/".device = "/dev/hda1";
        "/data" = {
          device = "/dev/hda2";
          fsType = "ext3";
          options = [ "data=journal" ];
        };
        "/bigdisk".label = "bigdisk";
      };
      users = {
        users = {
          nixos = {
            isNormalUser = true;
            password = "nixos";
          };
        };
      };
    };
  };
in
inputs.nixpkgs.lib.nixosSystem {
  modules = [
    nixosModule
  ];
  system = "x86_64-linux";
}
