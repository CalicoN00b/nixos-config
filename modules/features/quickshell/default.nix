{ self, inputs, moduleWithSystem, ... }:

{
    flake.nixosModules.quickshell = moduleWithSystem ({ self', ... }: {
        environment.systemPackages = [
            self'.packages.quickshell
        ];
    });

    perSystem = { pkgs, ... }: {
        packages.quickshell = inputs.wrapper-modules.wrappers.quickshell.wrap {
            inherit pkgs;
            configFile = ./shell.qml;
            configDir = ./.;
        };
    };
}