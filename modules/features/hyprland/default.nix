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

            runtimePkgs = with self'.packages; ([
                { data = kitty; prefix = true; }
                { data = rofi; prefix = true; }
                { data = hyprpaper; prefix = true; }
                { data = quickshell; prefix = true; }
            ]) ++ (with pkgs; [
                vesktop # need this as a required package bc of the keybind that opens it in wayland compatible mode
                hyprlock # Temporary, will be packaged into self'.packages
                hyprshutdown # Temporary
            ]);

            configFile = ./hyprland.lua;
        };
    };
}