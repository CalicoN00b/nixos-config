{ pkgs, ... }:

{
    programs.kitty = {
		enable = true;

		font = {
			package = pkgs.nerd-fonts.jetbrains-mono;
			name = "JetBrainsMonoNFM-Regular";
			size = 11;
		};

		settings = {
			background_opacity = 0.8;
		};
    };
}
