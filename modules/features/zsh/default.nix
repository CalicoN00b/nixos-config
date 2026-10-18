{ self, inputs, moduleWithSystem, ...  }:

{
    flake.nixosModules.zsh = moduleWithSystem ({ self', ... }: {
        programs.zsh = {
            enable = true;
            package = self'.packages.zsh;
        };

        users.defaultUserShell = self'.packages.zsh;
    });

    perSystem = { self', pkgs, lib, ... }: {
        packages = {
            zsh = inputs.wrapper-modules.wrappers.zsh.wrap {
                inherit pkgs;
                runtimePkgs = [ pkgs.lazygit ];
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