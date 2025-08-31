{ config, lib, pkgs, ... }:

{
    programs.zsh = {
        enable = true;
        initContent = lib.mkOrder 1500 "eval \"$(starship init zsh)\"";
    };
}