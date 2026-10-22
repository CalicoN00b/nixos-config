{ self, inputs, moduleWithSystem, ... }:

{
    flake.nixosModules.rofi = moduleWithSystem ({ self', ... }: {
        environment.systemPackages = [
            self'.packages.rofi
        ];
    });

    perSystem = { pkgs, ... }: {
        packages.rofi = inputs.wrapper-modules.lib.wrapPackage {
            inherit pkgs;
            package = pkgs.rofi;
            flags = {
                "-show" = "drun";
                "-theme" = ./catppuccin.rasi;
            };
        };
    };
}