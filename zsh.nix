{ config, lib, pkgs, ... }:

{
    home.packages = [ pkgs.zsh ];

    programs.zsh = {
        enable = true;
        initContent = lib.mkOrder 1500 "eval \"$(starship init zsh)\"";
    };
}