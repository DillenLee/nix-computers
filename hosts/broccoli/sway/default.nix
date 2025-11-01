{lib, config, pkgs, ...}: 
let 
green  = "#56b842";
black  = "#000000";
white  = "#ffffff";
orange = "#ffa742";
grey   = "#2c2c2c";
in {
wayland.windowManager.sway = {
	enable = true;
	checkConfig = false;
	extraConfig = ''
	exec swayidle -w \
		timeout 600 'pkexec brillo -O && pkexec brillo -q -S 0 -u 5000000' \
			 resume 'pkexec brillo -I' \
		timeout 605 'brightnessctl -q s 0' \
		timeout 660 'swaylock -f' \
		timeout 1200 'playerctl -a pause && systemctl suspend' \
		before-sleep 'swaylock -f && playerctl -a pause'
	'';
	wrapperFeatures.gtk = true;
	config = {
		modifier = "Mod4";
		# Use kitty as default terminal
		terminal = "kitty"; 
		menu = "fuzzel";


		output = {
			"*".bg =  "/home/dillen/.background/swaybg.png fill";
		};
		
		input = {
			# "1267:12780:ELAN07AC:00_04F3:31EC_Touchpad" = {
			"type:touchpad" = {
				tap = "enabled";
				drag = "enabled";
				drag_lock = "enabled";
			};
			"1:1:AT_Translated_Set_2_keyboard" = {
				xkb_model = "gb";	
			};
			"type:keyboard" = {
				xkb_options = "caps:escape";
			};
		};
		
		colors = {
			focused = {
				background = orange;
				border = orange;
				text = black;
				childBorder = grey;
				indicator = orange;
			};
		};

		keybindings = let
			mod = config.wayland.windowManager.sway.config.modifier;
			menu = config.wayland.windowManager.sway.config.menu;
			in lib.mkOptionDefault {
				"Control+Space" = "exec ${menu}";
				"${mod}+q" = "kill";
				"${mod}+w" = "exec firefox";
				"${mod}+e" = "exec kitty ranger";
				"${mod}+escape" = "exec swaylock";
				"${mod}+period" = "workspace next";
				"${mod}+comma"  = "workspace prev";
				"${mod}+i"  = "layout stacking";
				"${mod}+o"  = "layout tabbed";

				"XF86AudioRaiseVolume"  = "exec pactl set-sink-volume @DEFAULT_SINK@ +5% && ~/.config/sway/volume_notification.sh";
				"XF86AudioLowerVolume"  = "exec pactl set-sink-volume @DEFAULT_SINK@ -5% && ~/.config/sway/volume_notification.sh";
				"XF86AudioMute"  = "exec pactl set-sink-mute @DEFAULT_SINK@ toggle && ~/.config/sway/volume_notification.sh";
				"XF86AudioMicMute"  = "exec pactl set-source-mute @DEFAULT_SOURCE@ toggle";
				"XF86MonBrightnessDown"  = "exec brightnessctl set 5%- && ~/.config/sway/brightness_notification.sh";
				"XF86MonBrightnessUp"  = "exec brightnessctl set 5%+ && ~/.config/sway/brightness_notification.sh";
				"XF86AudioPlay"  = "exec playerctl play-pause";
				"Control+XF86AudioLowerVolume"  = "exec playerctl previous";
				"Control+XF86AudioRaiseVolume"  = "exec playerctl next";
				"XF86AudioNext"  = "exec playerctl next";
				"XF86AudioPrev"  = "exec playerctl previous";
				"Print"  				 = "exec grim -g '$(slurp -d)' - | wl-copy";
		};
		
		bars = [{
			fonts = {
				names = ["Nerd"];
				style = "italic";
				size  = 15.0;
			};
			colors = {
				statusline = orange;
			};
			position = "bottom";
			statusCommand = "i3blocks -c ~/.config/i3blocks/bottom";

		}];

	};
};
imports = [
	./i3blocks.nix
	./swaylock.nix
];
}

