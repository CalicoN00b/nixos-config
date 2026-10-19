{ self, inputs, ... }:

{
    flake.nixosModules.battery = { pkgs, ... }: {
        environment.systemPackages = [ pkgs.upower ];

        services = {
            upower.enable = true;
            power-profiles-daemon.enable = true;
        };
    };
}