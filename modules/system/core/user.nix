{ self, inputs, moduleWithSystem, ... }:

{
    flake.nixosModules.user = moduleWithSystem ({ self', ... }: {
        users = {
            users.igalaviz = {
                isNormalUser = true;
                shell = self'.packages.zsh;
                description = "Ian Galaviz";
                extraGroups = [ "networkmanager " "wheel" ];
            };

            defaultUserShell = self'.packages.zsh;
        };

        nix.settings.allowed-users = [ "igalaviz" ];
    });
}