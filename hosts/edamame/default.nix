{config, pkgs, host, home-manager, ...}:
{
	imports = [
		../../modules/hardware/edamame_hardware.nix
		../../modules/base
		../../modules/nixvim
		# ../../modules/sway
		../../users/nixos/dillen.nix
	];

	# Define the machine name... should it be in networking?
	networking.hostName = host; 
}
