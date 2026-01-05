{...}:
{
	# Needs ripgrep and telescope.
	imports = [
		./ripgrep.nix
		./telescope.nix
	];


	programs.nixvim = {

		opts.conceallevel = 1;	

		autoCmd = [
				{
					event = "FileType";
					pattern = "markdown";
					command = ":noremap <Leader>n :Obsidian new<CR>";
				}
				{
					event = "FileType";
					pattern = "markdown";
					command = ":noremap <Leader>s :Obsidian search<CR>";
				}
		];

		keymaps = [
			{
				key = "<Leader>t";
				action = 	"<cmd>Obsidian tags<CR>";
			}
		];

		plugins.obsidian = {
			enable = true;
			settings = {

				completion = {
					min_chars = 2;
					nvim_cmp = true;
				};
				

				new_notes_location = "current_dir";

				legacy_commands = false;

				workspaces = [
				{
					name = "notes";
					path = "~/notes";
				}
				];

				templates  = {
					folder = "!templates";
				};

				attachments = {
					img_folder = "!images"; 	
				};

				ui = {
					enable = true;
				};
				
				frontmatter = { 
						func = {__raw = ''
						function(note)
						-- Add the title of the note as an alias.
						if note.title then
							note:add_alias(note.title)
						end

						local out = { id = note.id, aliases = note.aliases, tags = note.tags }

						-- `note.metadata` contains any manually added fields in the frontmatter.
						-- So here we just make sure those fields are kept in the frontmatter.
							if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
								for k, v in pairs(note.metadata) do
									out[k] = v
								end
							end

							return out
						end
					'';
					};


				};

				note_id_func = { 
				__raw = ''
					function(title)
						local suffix = ""
						if title ~= nil then
								suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
						else
								for _ = 1, 4 do
									suffix = suffix .. string.char(math.random(65, 90))
									end
						end
						return suffix
					end
				'';
				};
			};

		};
	};
}
