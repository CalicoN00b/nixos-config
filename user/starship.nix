{ pkgs, ... }:

{
    home.packages = [ pkgs.starship ];
    programs.starship.enable = true;
    # The starship.toml will be downloaded from the zsh setup
}