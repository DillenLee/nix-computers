{lib, config, pkgs, ...}:
{
	programs.zed-editor = {
		enable = true;
		extensions = [
		  "nix"
			"julia"
		];
		userSettings = {
			vim_mode = true;
		};
	
	};
}
