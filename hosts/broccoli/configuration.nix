# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./cachix.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  #flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "Broccoli"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "gb";
    variant = "";
  };

	services.tailscale = {
		enable = true;
	};

  # Configure console keymap
  console.keyMap = "uk";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dillen = {
    isNormalUser = true;
    description = "Dillen";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

	users.defaultUserShell = pkgs.fish;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  # vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
		gcc
  ];
	environment.variables.EDITOR = "nvim";
  
  services = {
		gnome.gnome-keyring.enable = true;
		printing.enable = true;
		udisks2.enable = true;
		samba.enable = true;
		gvfs.enable = true;
		greetd = {                                                      
			enable = true;                                                       
			settings = {                                                         
				default_session = {                                                
					command = "${pkgs.tuigreet}/bin/tuigreet --time --cmd sway";
					user = "greeter";                                                
				};                                                                 
			};                                                                   
		};
		avahi = {
			enable = true;
			nssmdns4 = true;
			openFirewall = true;
		};
	};

  programs = {
		sway = {
			enable = true;
			wrapperFeatures.gtk = true;
		};
		gnome-disks.enable = true;
		fish.enable = true;
	};


	
	services.avahi = {
	};

  hardware.graphics.enable = true;

	security.polkit.enable = true;

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
