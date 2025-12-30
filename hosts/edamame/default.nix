{config, pkgs, host, ...}:
{
	imports = [
		../../modules/hardware/edamame_hardware.nix
		../../modules/base
		../../modules/nixvim
		../../modules/network/dhcp.nix
		# ../../modules/sway
		../../users/nixos/dillen.nix
	];

	# Define the machine name... should it be in networking?
	networking.hostName = host; 
}
