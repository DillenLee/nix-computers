{lib, ...}: 
{
	programs.i3blocks = {
			enable = true;
			bars = {
				bottom = {
					date = {
						command = "date +%Y-%m-%d";  
						interval = 1;
					};
					time = lib.hm.dag.entryAfter [ "date" ] {
						command = "date +%X"; 
						interval=1;
					};
					battery = lib.hm.dag.entryAfter [ "date" ] {
						command = "bash ~/.config/i3blocks/battery.sh";
						interval = 1;
					};
				};
			};
		};
}
