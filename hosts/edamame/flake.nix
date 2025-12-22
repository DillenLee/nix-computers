{
	description = "A very basic flake";

	inputs = {
		nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
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
		lib = nixpkgs.lib;
	system = "x86_64-linux";
	pkgs = nixpkgs.legacyPackages.${system};
	in
	{
		nixosConfigurations.edamame = lib.nixosSystem {
			inherit system;
			modules = [ 
				./configuration.nix 
			];
		};

		homeConfigurations = {
			dillen = home-manager.lib.homeManagerConfiguration {
				inherit pkgs;
				modules = [
					./home.nix
						nixvim.homeModules.nixvim
				];
			};
		};
	};
}

