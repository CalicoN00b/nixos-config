{ self, inputs, moduleWithSystem, ... }:

{
    flake.nixosModules.hyprland = moduleWithSystem ({ self', ... }: {
        programs.hyprland = {
            enable = true;
            package = self'.packages.hyprland;
        };
    });

    perSystem = { pkgs, self', ... }: {
        packages.hyprland = inputs.wrapper-modules.wrappers.hyprland.wrap {
            inherit pkgs;

            runtimePkgs = with self'.packages; [
                { data = kitty; prefix = true; }
                { data = rofi; prefix = true; }
                { data = hyprpaper; prefix = true; }
            ];

            configFile = ./hyprland.lua;
        };
    };
}