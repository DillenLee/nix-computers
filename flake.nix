{
  description = "My nixos machines and home-manager systems";

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

  outputs = inputs@{ self, nixpkgs, home-manager, nixvim, ... }:
  let
		# Define a reproducible host maker 
    mkHost = { system, host }:
      nixpkgs.lib.nixosSystem {

				# A requirement of nixosSystem 
        inherit system;

        modules = [
          ./hosts/${host}/default.nix
					home-manager.nixosModules.home-manager
					nixvim.nixosModules.nixvim
        ];
				specialArgs = {inherit host;};
      }; 
			
  in {

		# nixos machines
    nixosConfigurations = {

      # broccoli = mkHost {
      #   system = "x86_64-linux";
      #   host = "broccoli";
      # };
      #
      # cauliflower = mkHost {
      #   system = "x86_64-linux";
      #   host = "cauliflower";
      # };

			edamame = mkHost {
				system = "x86_64-linux";
				host = "edamame";
			}; 
		};

		# Home-manager only machines
		homeConfigurations = {
			artichoke = import ./modules/mkHome.nix {
        inherit inputs;
        system = "x86_64-linux";
				username = "dillen";
        host = "artichoke";
			};
		};
	};
}
