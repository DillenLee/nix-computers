{
	programs.nixvim.plugins.cmp = {
		enable = true;
		autoEnableSources = true;
		settings = {
			sources = [ 
				{ name = "nvim_lsp"; }
				{ name = "path"; }
				{ name = "buffer"; }
				{ name = "luasnip"; }
				{ name = "vimtex"; }
				];
			mapping = {
				__raw = ''
					cmp.mapping.preset.insert({
							['<C-b>'] = cmp.mapping.scroll_docs(-4),
							['<C-f>'] = cmp.mapping.scroll_docs(4),
							['<C-a>'] = cmp.mapping.abort(),
							['<CR>'] = cmp.mapping.confirm({ select = true }),
							})
				'';
			};
		};
	};
	# enable cmp-vimtex 
	programs.nixvim.plugins.cmp-vimtex = {
		enable = true;
	};
	programs.nixvim.plugins.cmp_luasnip = {
		enable = true;
	};

}
