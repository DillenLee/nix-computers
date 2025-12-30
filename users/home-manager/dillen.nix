{home-manager,...}:
{
	# This is the home-manager user file 
	home-manager.useGlobalPkgs = true;
	home-manager.useUserPackages = true;

	# Create the home-manager user, this will be imported as a file
	home-manager.users.dillen = {

		home.username = "dillen";
		home.homeDirectory =  "/home/dillen";
		home.stateVersion = "25.05"; 

		programs.home-manager.enable = true;
	};
}

