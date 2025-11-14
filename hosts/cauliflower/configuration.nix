# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
			./network.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "cauliflower"; # Define your hostname.
 # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

	# GPU support, uses intel core i5-6500t so Skylake GPU
  systemd.services.jellyfin.environment.LIBVA_DRIVER_NAME = "iHD"; 
  environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; };

	hardware.graphics = {
		enable = true;
    extraPackages = with pkgs; [
      intel-ocl # Generic OpenCL support
      intel-media-driver # For Broadwell era gpu 
		];
	};


  networking.networkmanager.enable = true;

	networking.firewall.checkReversePath = false; 
	networking.wireguard.enable = true;
	networking.firewall.allowedUDPPorts = [ 3389 51820 8920];

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
    layout = "us";
    variant = "";
  };

  # Enable tailscale
  services.tailscale = {
	  enable = true;
  };

  services.xserver.enable = true;


  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.dillen = {
    isNormalUser = true;
    description = "Dillen";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  users.users.spielberg= {
    isNormalUser = true;
    description = "Jellyfin and Deluge";
    extraGroups = [ "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  environment.systemPackages = with pkgs; [
    jellyfin
    jellyfin-web
    jellyfin-ffmpeg
  ];


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = {
		enable = true;
		settings.X11Forwarding = true;
	};

	# Enable jellyfin
	services.jellyfin = {
		enable = true;
		openFirewall = true;
		user = "spielberg";
		configDir = "/home/spielberg/jellyfin";
	};

	# Deluge
	services.deluge = {
		enable = true;
		user = "spielberg";
		web.enable = true;
		web.openFirewall = true;
		# declarative = true;
		# config = {
		# 	download_location = "/home/dillen/films";
		# };
	};

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.11"; # Did you read the comment?

}
