{ config, pkgs, nixvim, ... }:

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

  imports = [ ./nixvim ];

  nixpkgs.config.allowUnfreePredicate = (_: true); home.packages = [
    pkgs.obsidian
		pkgs.vscodium
		pkgs.zotero
		pkgs.neofetch
		pkgs.nerdfonts
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage plain files is through 'home.file'.
  home.file = {
  };

  programs = {
  
		firefox.enable = true;
		btop.enable = true;
# thunderbird.enable = true;
		texlive.enable = true;
		kitty = {
			enable = true;
			font.name = "Hack Nerd Font";
			font.size = 23;
			themeFile = "OneDark";		
		};
		ripgrep.enable = true;
		zathura.enable = true;

  };

  # Sway?
 # wayland.windowManager.sway = { enable = true; systemd.enable = true;
 # };

  home.sessionVariables = { EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
