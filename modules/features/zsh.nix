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
                    
                    export LESS_TERMCAP_mb=$'\e[1;31m'
                    export LESS_TERMCAP_md=$'\e[1;31m'
                    export LESS_TERMCAP_me=$'\e[0m'
                    export LESS_TERMCAP_se=$'\e[0m'
                    export LESS_TERMCAP_so=$'\e[1;33;44m'
                    export LESS_TERMCAP_ue=$'\e[0m'
                    export LESS_TERMCAP_us=$'\e[4;1;32m'
                    export LESS_TERMCAP_mr=$'\e[7m'
                    export LESS_TERMCAP_mh=$'\e[2m'
                    export LESS_TERMCAP_ZN=$'\e[74m'
                    export LESS_TERMCAP_ZV=$'\e[75m'
                    export LESS_TERMCAP_ZO=$'\e[73m'
                    export LESS_TERMCAP_ZW=$'\e[75m'
                    export MANPAGER='less'
                    export GROFF_NO_SGR=1

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