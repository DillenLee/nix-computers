{...}:
{
	services.way-displays = {
		enable = true;
		settings = {
				SCALING = false;
# This is all becoming quite tailored to the specific machine
# If we want to extend this to the dendritic pattern, this is
# a custom solution
				VRR_OFF = [
					"eDP-1"
				];

			};
	};
}
