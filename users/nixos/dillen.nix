{ lib, config, pkgs, ...}:
{

	# This is no longer HM
  users.users.dillen = {
    isNormalUser = true;
    description = "Dillen";
    extraGroups = [ "networkmanager" "wheel" ];
  };

	# We want any nixos machine user to import the home-manager
	imports = [
		../home-manager/dillen.nix
	];

}
