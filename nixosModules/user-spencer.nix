{ inputs, ... }@flakeContext:
{ config, lib, pkgs, ... }: {
  imports = [
    inputs.self.homeConfigurations.spencer.nixosModule
  ];
}
