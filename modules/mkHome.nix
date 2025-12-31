{ inputs, system, username, host }:
	let
		pkgs = import inputs.nixpkgs {
			inherit system;
			config.allowUnfree = true;
		};

		hostCfg = import ../hosts/${host};
	in
	inputs.home-manager.lib.homeManagerConfiguration {
		inherit pkgs;

		modules =
			hostCfg.modules ++ [
				{
					home.username = username;
					home.homeDirectory = "/home/${username}";
					home.stateVersion = "24.11";
					programs.home-manager.enable = true;
				}
			inputs.nixvim.homeModules.nixvim
			] 
			;
}

