{ self, inputs, moduleWithSystem, ... }:

{
    flake.nixosModules.kitty = moduleWithSystem ({ self', ... }: {
        environment.systemPackages = [
            self'.packages.kitty
        ];
    });

    perSystem = { self', pkgs, lib, ... }: {
        packages.kitty = inputs.wrapper-modules.wrappers.kitty.wrap {
            inherit pkgs;

            environment = let
                jetbrains-mono = pkgs.nerd-fonts.jetbrains-mono;
                fontsConf = pkgs.makeFontsConf {
                    fontDirectories = [ jetbrains-mono ];
                };
            in {
                "FONTCONFIG_FILE" = "${fontsConf}";
            };

            font = {
                name = "JetBrainsMonoNFM-Regular";
                size = 11;
            };

            settings = {
                font_size = 11;
                background_opacity = 0.8;
                cursor_trail = 1;
                cursor_shape = "beam";
                shell = "${lib.getExe self'.packages.zsh}";
            };

            themeFile = "Catppuccin-Mocha";
        };
    };
}