{ ... }:

{
    programs.yazi = {
        enable = true;

        settings = {
            mgr = {
                sort_by = "natural";
                sort_dir_first = true;
                show_hidden = false; # Press "." to toggle showing hidden files.
                linemode = "mtime";
            };
        };

        flavors = {
            catppuccin-mocha = ./catppuccin-mocha.yazi;
        };

        theme = {
            dark = "catppucin-mocha";
        };
    };
}