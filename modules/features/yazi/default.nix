{ self, inputs, moduleWithSystem, ... }:

{
    flake.nixosModules.yazi = moduleWithSystem ({ self', ... }: {
        programs.yazi = {
            enable = true;
            package = self'.packages.yazi;
        };
    });

    perSystem = { pkgs, ... }: {
        packages.yazi = inputs.wrapper-modules.wrappers.yazi.wrap {
            inherit pkgs;

            flavors.catppuccin-mocha = ./catppuccin-mocha.yazi;

            settings = {
                yazi = {
                    mgr = {
                        sort_by = "natural";
                        sort_dir_first = true;
                        show_hidden = false;
                        linemode = "mtime";
                    };
                };

                theme = {
                    dark = "catppuccin-mocha";
                    light = "catppuccin-mocha";
                };
            };
        };
    };
}