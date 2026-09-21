{ ... }:

{
    imports = [
        ./fonts.nix
        ./virtualisation.nix
        ./services.nix
        ./user.nix
        ./hardware-configuration.nix
        ./system.nix
        ./network.nix
        ./programs.nix
    ];
}