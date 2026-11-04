{
	programs.nixvim.plugins.neogen= {
		enable = true;
		settings = {
			languages = {
				python.template.annotation_convention = "numpydoc";
			};
		};
	};
}
