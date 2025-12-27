{
	imports = [
		./gb.nix
	];
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

	# Set the state   
	system.stateVersion = "25.05";
}
