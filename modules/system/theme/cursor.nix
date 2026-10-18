{ self, inputs, ... }:

{
    flake.nixosModules.cursor = { pkgs, ... }: {
        environment.systemPackages = [
            pkgs.catppuccin-cursors.mochaDark
        ];
    };
}