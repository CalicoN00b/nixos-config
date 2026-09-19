{ pkgs, lib, ... }:

{
    programs = {
        zsh = {
            enable = true;
            initContent = lib.mkOrder 1500 ''
                eval "$(starship init zsh)"
                starship preset bracketed-segments -o ~/.config/starship.toml

                export JAVA_HOME=${pkgs.jdk}/lib/openjdk 
            '';
        };

        starship.enable = true;
    };
}