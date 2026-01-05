{...}:
{
	# Needs ripgrep
	imports = [./ripgrep.nix];

	programs.nixvim = {
		keymaps = [
			{
				key = "<Leader>s";
				action = 	"<cmd>Telescope find_files<CR>";
			}
		];

		autoCmd = [
		{
			callback = {
				__raw = ''
				function() 
					vim.keymap.set('v', '<C-F>', require('telescope.builtin').grep_string, { noremap = true, silent = true }) 
					vim.keymap.set('n', '<C-F>', require('telescope.builtin').live_grep, { noremap = true, silent = true }) 
					vim.keymap.set('n', '<Leader>f', require('telescope.builtin').git_files, { noremap = true, silent = true }) 
				end
				'';
				};
			event = "BufEnter";
			pattern = "";
		}
		];

		plugins.telescope = {
				enable = true;
		};
	};
}
