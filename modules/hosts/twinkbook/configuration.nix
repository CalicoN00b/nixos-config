{ self, inputs, ... }:

{
    flake.nixosModules.twinkbook-configuration = { ... }: {
        imports = [ ./_hardware-configuration.nix ];

        networking.hostname = "twinkbook";
        system.stateVersion = "26.05";
    };
}