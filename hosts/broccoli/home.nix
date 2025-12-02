{ lib, config, pkgs, nixvim, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should manage.
  home.username = "dillen";
	home.homeDirectory = "/home/dillen";

  # This value determines the Home Manager release that your configuration is compatible with. This helps avoid 
  # breakage when a new Home Manager release introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do want to update the value, then make 
  # sure to first check the Home Manager release notes.
  home.stateVersion = "24.05"; # Please read the comment before changing.

  imports = [ ../../nixvim ./sway ];

  nixpkgs.config.allowUnfreePredicate = (_: true); home.packages = [
		pkgs.cachix
    pkgs.obsidian
    pkgs.zotero
    pkgs.neofetch
	  pkgs.inkscape
	  pkgs.nerd-fonts.hack
	  pkgs.nerd-fonts.iosevka
	  pkgs.libertine
	  pkgs.wl-clipboard
	  pkgs.xfce.thunar
	  pkgs.xfce.thunar-volman
	  pkgs.xarchiver
		# pkgs.vscodium
		pkgs.arc-theme
		pkgs.papirus-icon-theme
		pkgs.gnome-tweaks
		pkgs.acpi
		pkgs.texliveFull
		pkgs.inkscape
		pkgs.eog
		pkgs.libreoffice
		pkgs.brillo
		pkgs.krita
		pkgs.wxmaxima
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage plain files is through 'home.file'.
  home.file = {
  };

  programs = {
		firefox.enable = true;
		btop.enable = true;
		ripgrep.enable = true;
		zathura.enable = true;
		ranger.enable = true;
		wofi.enable = true;
		swayimg.enable = true;
		direnv = {
				enable = true;
				nix-direnv.enable = true;
			};
		vscode = {
			enable = true;
			profiles.default.extensions = with pkgs.vscode-extensions; [
					platformio.platformio-vscode-ide
					ms-vscode-remote.remote-ssh
					ms-vscode.cpptools-extension-pack
					vscodevim.vim
				];
		};
		kitty = {
			enable = true;
			font.name = "Hack Nerd Font";
			font.size = 15;
			themeFile = "Doom_One";
			shellIntegration.enableFishIntegration = true;
		};
		git = {
			enable = true;
			lfs.enable = true;
			userEmail = "dillen.lee20@imperial.ac.uk";
			userName = "Dillen Lee";
		};
		fuzzel = {
			enable = true;
			settings = {
				main = {
					prompt="λ: ";
					icon-theme = "Papirus-Dark";
					lines = 5;
					width = 40;
					tabs = 4;
					layer = "overlay";
				};
				colors = {
					background = "212121ff";
					text = "ffffffff";
					match = "ff5722ff";
					selection = "37474fff";
					selection-text = "ffffffff";
					selection-match = "ff5722ff";
					border = "263238ff";
				};
				border = {
					width=0;
					radius=10;
				};
			};
		};
		poetry.enable = true;
		starship.enable = true;
		# i3blocks = {
		# 	enable = true;
		# 	bars = {
		# 		bottom = {
		# 			date = {
		# 				command = "date +%m-%d";  
		# 				interval = 1;
		# 			};
		# 			time = lib.hm.dag.entryAfter [ "date" ] {
		# 				command = "date +%X"; 
		# 				interval=1;
		# 			};
		# 			battery = lib.hm.dag.entryAfter [ "date" ] {
		# 				command = "bash ~/.config/i3blocks/battery.sh";
		# 				interval = 1;
		# 			};
		# 		};
		# 	};
		# };
  };


	wayland.windowManager.sway = {
		enable = true;
	};

	services = {
		dunst = {
			enable = true;
		};
		nextcloud-client = {
			enable = true;
			startInBackground = true;
		};
	};

  home.sessionVariables = { 
		QT_QPA_PLATFORM = "wayland";
  };


	gtk = {
		enable = true;
		theme.name = "Arc-Dark";
	};
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
