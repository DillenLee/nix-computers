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
					command = ":noremap <C-N> :Obsidian new<CR>";
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
								local title = note.title or ""

								return {
									id = note.id,
									title = title,
									aliases = title ~= "" and { title } or {},
									created = os.date("%Y-%m-%d %H:%M"),
								}
							end
					'';
					};


				};
				note_id_func = {
					__raw = ''
						function(title)
							suffix = ""
							for _ = 1, 4 do
								suffix = suffix .. string.char(math.random(65, 90))
							end
							title = os.date("%Y%m%d") .. "-" .. suffix 
							return title
						end
					'';
				};

				# note_id_func = { 
				# __raw = ''
				# 	function(title)
				# 		local suffix = ""
				# 		note.title = 
				# 				for _ = 1, 4 do
				# 					suffix = suffix .. string.char(math.random(65, 90))
				# 					end
				# 		end
				# 		return suffix
				# 	end
				# '';
				# }; 
				# note_id_func = {
				# 	__raw = ''
				# 		return require("obsidian.builtin").zettel_id;
				# 	'';
				# };

			};

		};
	};
}
