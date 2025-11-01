{
	programs.nixvim.plugins.lsp = {
			enable = true;

			servers = {
				ruff.enable = true; # Python
				julials.enable = true; # Julia
				clangd.enable = true; # C/C++
			};
	};
}
