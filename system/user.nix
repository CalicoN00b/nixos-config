{ pkgs, inputs, username, host, nixvim, frc-nix, ... }:

{
    imports = [ inputs.home-manager.nixosModules.home-manager ];

    home-manager = {
        useUserPackages = true;
        useGlobalPkgs = true;
        extraSpecialArgs = { 
            inherit inputs username host nixvim;
            frc-nix-pkgs = frc-nix.packages.${pkgs.stdenv.hostPlatform.system};
        };
        users.${username} = {
            imports = [ ./../home ];

            home = {
                username = "${username}";
                homeDirectory = "/home/${username}";
                stateVersion = "26.05";
                sessionVariables = {
                    EDITOR = "nvim";
                };
            };
            
            programs.home-manager.enable = true;
        };

        backupFileExtension = "home-backup";
    };

    users.users.${username} = {
        isNormalUser = true;
        description = "${username}";
        extraGroups = [ "networkmanager" "wheel" ];
        shell = pkgs.zsh;
    };

    nix.settings.allowed-users = [ "${username}" ];
}