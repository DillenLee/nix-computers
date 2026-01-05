{...}:
{
	programs.nixvim = {
		lsp = {
				enable = true;

				inlayHints.enable = true;

				keymaps = [
					{
						key = "gd";
						lspBufAction = "definition";
					}
					{
						key = "gr";
						lspBufAction = "references";
					}
					{
						key = "K";
						lspBufAction = "hover";
					}
					{
						action = {
							__raw =
							"function() vim.diagnostic.open_float() end";
							};
						key = "gs";
					}
					{
						action = {
							__raw =
							"require('telescope.builtin').lsp_definitions";
							};
						key = "gd";
					}

				];
				
				servers = {
					ruff.enable = true; # Python linter
					jedi_language_server.enable = true; # Python goto
					# julials.enable = true; # Julia
					clangd.enable = true; # C/C++
					# arduino_language_server.enable = true;
					nixd.enable = true;
				};
		};

		# Required for now to ensure that the servers have default values.
		# Probably expect this to be removed soon.
		plugins.lspconfig.enable = true;

	};
}
