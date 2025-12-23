{
  description = "My nixos machines";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager/master";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		nixvim = {
			url = "github:nix-community/nixvim";
			inputs.nixpkgs.follows = "nixpkgs";
		};

  };

  outputs = { self, nixpkgs, ... }:
  let
    mkHost = { system, host }:
      nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./hosts/${host}/default.nix
        ];
      };
  in {
    nixosConfigurations = {

      artichoke = mkHost {
        system = "x86_64-linux";
        host = "artichoke";
      };

      broccoli = mkHost {
        system = "x86_64-linux";
        host = "broccoli";
      };

      cauliflower = mkHost {
        system = "x86_64-linux";
        host = "cauliflower";
      };

			edamame = mkHost {
				system = "x86_64-linux";
				host = "edamame";
     }; 
    };
  };
}
