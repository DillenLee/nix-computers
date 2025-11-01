{
	programs.nixvim = {

		plugins.vimtex = {
			enable = true;
			autoLoad = true;
			texlivePackage = null;
			settings = {
				view_method = "zathura";
				compiler_method = "latexmk";
			};
		};
		
		# Use lualatex instead of standard latex to ensure proper font support
		extraConfigVim = ''
			let g:vimtex_compiler_latexmk_engines = {"_" : "-lualatex"}
		'';

		# Use keymaps 
		
		autoCmd = [
			{
				command = "noremap <Leader>vw :VimtexCountWords<CR>";
				event = [
					"BufEnter"
					"BufWinEnter"
				];
				pattern = [
					"*.tex"
				];
			}

			{
				command = "noremap <Leader>ts :setlocal spell spelllang=en_gb<CR>";
				event = [
					"BufEnter"
					"BufWinEnter"
				];
				pattern = [
					"*.tex"
				];
			}
		];
	};
}
