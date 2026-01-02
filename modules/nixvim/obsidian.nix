{...}:
{
	programs.nixvim.plugins.obsidian = {
			enable = true;

			completion = {
				min_chars = 2;
				nvim_cmp = true;
			};
			new_notes_location = "current_dir";
			workspaces = [
			{
				name = "personal";
				path = "~/notes/";
			}
			];


		};
}
