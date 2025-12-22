{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
  let 
    system = "x86_64-linux";
    lib = nixpkgs.lib;
  in
  {
    nixosConfigurations = {
       nixos = lib.nixosSystem {  
         inherit system;
         modules = [ ./configuration.nix ];
       };
    };
  };
}
