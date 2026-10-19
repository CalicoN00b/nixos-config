{ self, inputs, ... }:

{
    flake.nixosModules.nix-settings = { ... }: {
        nix.settings = {
            experimental-features = [ "nix-command" "flakes" ];
            warn-dirty = false;
        };

        nixpkgs.config.allowUnfree = true;
    };
}