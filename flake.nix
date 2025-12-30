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

  outputs = { self, nixpkgs, home-manager, nixvim, ... }:
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

			
		# Function for only home-manager systems
		mkHM = { system, host }:
			home-manager.lib.homeManagerConfiguration {

				pkgs = nixpkgs.legacyPackages.${system};

				modules = [
					# ./hosts/${host}/default.nix	
					./users/home-manager/dillen.nix
					nixvim.homeModules.nixvim
				];
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
			dillen = mkHM {
				system = "x86_64-linux";
				host = "artichoke";
			};
		};
	};
}
