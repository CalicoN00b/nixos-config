{ self, inputs, ... }:

{
    flake.nixosConfigurations.twinkbook = inputs.nixpkgs.lib.nixosSystem {
        modules = with self.nixosModules; [
            twinkbook-configuration
        ];
    };
}