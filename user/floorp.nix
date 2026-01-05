{ pkgs, ... }:

{
    programs.floorp = {
	enable = true;

	package = pkgs.floorp-bin.override {
	    hash = "sha256-feIRCZuyB8xwUoI1FMWJQ6yupgC2aAavADQ9mrk0zMM=";
	};
    };
}
