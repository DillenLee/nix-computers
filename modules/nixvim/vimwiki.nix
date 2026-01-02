{...}:
{
	programs.nixvim.plugins.vimwiki = {
		enable = true;
		settings = {
				list = [
					{
						syntax = "markdown";
					}
				];
			};
		};
	}
