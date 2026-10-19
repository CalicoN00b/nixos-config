{ self, inputs, ... }:

{
    flake.nixosModules.twinkbook-configuration = { pkgs, ... }: {
        imports = [ ./_hardware-configuration.nix ];

        networking.hostname = "twinkbook";
        system.stateVersion = "26.05";

        services.displayManager.autologin = {
            enable = true;
            user = "igalaviz";
        };

        environment.systemPackages = (with pkgs; [
            obsidian
        ]) ++ (with inputs.frc-nix.packages.${pkgs.stdenv.hostPlatform.system}; [
            advantagescope
            elastic-dashboard
            pathplanner
        ]);
    };
}