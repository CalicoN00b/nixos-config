{
    self,
    inputs,
    ...
}: {
    flake.nixosModules.twinkbook-configuration = {
        pkgs,
        inputs',
        ...
    }: {
        imports = [./_hardware-configuration.nix];

        networking.hostName = "twinkbook";
        system.stateVersion = "26.05";

        services.displayManager.autoLogin = {
            enable = true;
            user = "igalaviz";
        };

        environment.systemPackages =
            (with pkgs; [
                obsidian
            ])
            ++ (with inputs'.frc-nix.packages; [
                advantagescope
                elastic-dashboard
                pathplanner
            ]);
    };
}
