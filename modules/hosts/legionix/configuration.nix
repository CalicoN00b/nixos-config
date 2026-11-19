{
    self,
    inputs,
    ...
}: {
    flake.nixosModules.legionix-configuration = {pkgs, ...}: {
        imports = [./_hardware-configuration.nix];

        networking.hostName = "legionix";
        system.stateVersion = "26.05";

        boot.loader.grub = {
            default = "saved";
            useOSProber = true;
        };
    };
}
