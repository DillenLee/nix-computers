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
			overlay = (final: prev: {
					kicad6 = import (fetchTarball {
							url = "https://github.com/NixOS/nixpkgs/archive/nixos-22.11.tar.gz";
							}) {
					system = prev.system;
					}.kicad;
					});
      # pkgs = nixpkgs.legacyPackages.${system};
			pkgs = import nixpkgs {
				inherit system;
				overlays = [ overlay ];
				};
    in
      {
	nixosConfigurations.Broccoli= lib.nixosSystem {
	  inherit system;
		modules = [
			({ ... }: {
			 nixpkgs.overlays = [ overlay ];
			 environment.systemPackages = [ pkgs.kicad6 ];
			 })
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
