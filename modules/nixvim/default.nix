{...}:
{
	imports = [
		./bufferline.nix
			./vimtex.nix
			./treesitter.nix
			./comment.nix
			./lsp.nix
			./cmp.nix
			./luasnip.nix
			./remote-nvim.nix
			./obsidian.nix
			./vim-css-color.nix
			./nvim-suround.nix
			./telescope.nix
			./zotcite.nix
			# ./vimwiki.nix
	];
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

# Autocmd
# Not good
		autoCmd = [
			# {
			# 	event = "FileType";
			# 	pattern = "cpp";
			# 	command = "map <buffer> <F2> :w<CR> :! g++ %<CR> :term <CR>";
			# }
			# {
			# 	event = "FileType";
			# 	pattern = "python";
			# 	command = "map <buffer> <F2> :w<CR> :exec '!python' shellescape(@%, 1)<CR>";
			# }
			# {
			# 	event = "FileType";
			# 	pattern = "nix";
			# 	command = "map <buffer> <F2> :w<CR> :! home-manager switch --flake .<CR>";
			# 	}

		];

		# colourscheme
		colorschemes.onedark.enable = true;

	};
}
