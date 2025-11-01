{

programs.nixvim = {
  enable = true;
	defaultEditor = true;
	viAlias = true;
	vimAlias = true;

  # default neovim configuration stuff
  opts = {
    shiftwidth = 2;
    tabstop = 2;
    relativenumber = true;
    autoindent = true;
    smartindent = true; 
	};  

  # colourscheme
  colorschemes.nightfox.enable = true;

  # simple one liners
  plugins = {
			vim-css-color.enable = true;
    };
  };

# import all the plugins
  imports = [
    ./bufferline.nix
    ./vimtex.nix
    ./treesitter.nix
		./comment.nix
		./lsp.nix
		./cmp.nix
  ];
}
