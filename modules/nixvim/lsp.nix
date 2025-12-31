{...}:
{
	programs.nixvim.plugins.lsp = {
			enable = true;

			servers = {
				ruff.enable = true; # Python linter
				jedi_language_server.enable = true; # Python goto
				# julials.enable = true; # Julia
				clangd.enable = true; # C/C++
				# arduino_language_server.enable = true;
				nixd.enable = true;
			};
	};
}
