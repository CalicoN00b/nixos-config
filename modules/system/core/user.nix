{
    self,
    inputs,
    moduleWithSystem,
    ...
}: {
    flake.nixosModules.user = moduleWithSystem ({pkgs, ...}: {
        imports = [self.nixosModules.zsh];

        users.users.igalaviz = {
            isNormalUser = true;
            shell = pkgs.zsh;
            description = "Ian Galaviz";
            extraGroups = ["networkmanager" "wheel"];
        };

        nix.settings.allowed-users = ["igalaviz"];
    });
}
