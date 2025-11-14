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
		vpn-confinement = {
			url = "github:Maroka-chan/VPN-Confinement";
		};
  };

  outputs = { self, nixpkgs, home-manager, nixvim, vpn-confinement, ... }:
    let
      lib = nixpkgs.lib;
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
		{
			nixosConfigurations.cauliflower= lib.nixosSystem {
				inherit system;
				modules = [ 
					./configuration.nix 
					vpn-confinement.nixosModules.default
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

