{...}:
{
	# Needs ripgrep
	imports = [./ripgrep.nix];

	programs.nixvim = {

		# This allows us to default use git_files and fallback to find_files if required
		extraConfigLua = ''
    package.preload["extra-telescope"] = function()

			local M = {}

			-- We cache the results of "git rev-parse"
			-- Process creation is expensive in Windows, so this reduces latency
			local is_inside_work_tree = {}

			M.project_files = function()
			local opts = {} -- define here if you want to define something

			local cwd = vim.fn.getcwd()
			if is_inside_work_tree[cwd] == nil then
				vim.fn.system("git rev-parse --is-inside-work-tree")
					is_inside_work_tree[cwd] = vim.v.shell_error == 0
					end

					if is_inside_work_tree[cwd] then
						require("telescope.builtin").git_files(opts)
					else
						require("telescope.builtin").find_files(opts)
					end
			end

			return M

    end
		'';

		autoCmd = [
		# Set the keymaps for telescope config
		{
			callback = {
				__raw = ''
				function() 
					vim.keymap.set('v', '<C-F>', require('telescope.builtin').grep_string, { noremap = true, silent = true }) 
					vim.keymap.set('n', '<C-F>', require('telescope.builtin').live_grep, { noremap = true, silent = true }) 
					vim.keymap.set('n', 'ff', require('extra-telescope').project_files, { noremap = true, silent = true }) 
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
