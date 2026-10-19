{ self, inputs, moduleWithSystem, ...  }:

{
    flake.nixosModules.zsh = moduleWithSystem ({ self', ... }: {
        programs.zsh = {
            package = self'.packages.zsh;
            enable = true;
            enableCompletion = true;
            enableBashCompletion = true;
            autosuggestions.enable = true;
            syntaxHighlighting.enable = true;
            histSize = 10000;
        };
    });

    perSystem = { self', pkgs, lib, ... }: {
        packages = {
            zsh = inputs.wrapper-modules.wrappers.zsh.wrap {
                inherit pkgs;
                zshAliases = {
                    ls = "${lib.getExe pkgs.lsd} -l";
                    g = "${lib.getExe pkgs.lazygit}";
                };
                zshrc.content = ''
                    export EDITOR=nvim

                    eval "$(${lib.getExe self'.packages.starship} init zsh)"
                '';                    
            };

            starship = inputs.wrapper-modules.wrappers.starship.wrap {
                inherit pkgs;
                preset = "bracketed-segments";
            };
        };
    };
}