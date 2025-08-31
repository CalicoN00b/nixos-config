{ lib, pkgs, ... }:

{
    home.packages = [ pkgs.zsh ];

    programs.zsh = {
        enable = true;
        initContent = lib.mkOrder 1500 ''
            eval "$(starship init zsh)"
            starship preset bracketed-segments -o ~/.config/starship.toml
        '';
    };
}