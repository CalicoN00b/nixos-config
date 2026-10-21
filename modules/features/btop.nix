{ self, inputs, moduleWithSystem, ... }:

{
    flake.nixosModules.btop = moduleWithSystem ({ self', ... }: {
        environment.systemPackages = [
            self'.packages.btop
        ];
    });

    perSystem = { self', pkgs, ... }: {
        packages.btop = inputs.wrapper-modules.wrappers.btop.wrap {
            inherit pkgs;

            settings = {
                color_theme = "TTY";
                theme_background = false;
                update_ms = 1000;
                rounded_corners = true;
            };
        };
    };
}