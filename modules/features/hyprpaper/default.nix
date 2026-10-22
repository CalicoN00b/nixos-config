{ self, inputs, moduleWithSystem, ... }:

{
    flake.nixosModules.hyprpaper = moduleWithSystem ({ self', ... }: {
        environment.systemPackages = [
            self'.packages.hyprpaper
        ];
    });

    perSystem = { pkgs, ... }: {
        packages.hyprpaper = let 
            config-file = builtins.toFile "hyprpaper.conf" ''
                wallpaper {
                    monitor=
                    fit_mode=cover
                    path=${./wallpapers}
                    timeout=600
                }
                splash = false
            '';
        in
            inputs.wrapper-modules.lib.wrapPackage {
                inherit pkgs;
                package = pkgs.hyprpaper;
                flags = {
                    "--config" = config-file;
                };
            };
    };
}