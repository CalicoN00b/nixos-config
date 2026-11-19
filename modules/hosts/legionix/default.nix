{
    self,
    inputs,
    ...
}: {
    flake.nixosConfigurations.legionix = inputs.nixpkgs.lib.nixosSystem {
        modules = with self.nixosModules; [
            core
            theme
            hyprland
            legionix-configuration
        ];
    };
}
