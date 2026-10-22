{ self, inputs, moduleWithSystem, ... }:

{
    flake.nixosModules.rofi = moduleWithSystem ({ self', ... }: {
        environment.systemPackages = [
            self'.packages.rofi
        ];
    });

    perSystem = { pkgs, ... }: {
        packages.rofi = inputs.wrapper-modules.wrappers.rofi.wrap {
            inherit pkgs;

            theme = "purple";
        };
    };
}