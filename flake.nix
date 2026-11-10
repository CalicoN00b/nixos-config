{
    description = "CalicoN00b's NixOS Config";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-26.05";

        frc-nix.url = "github:frc4451/frc-nix/season/2026";

        flake-parts.url = "github:hercules-ci/flake-parts";
        import-tree.url = "github:denful/import-tree";
        wrapper-modules.url = "github:nix-community/nix-wrapper-modules";
    };

    outputs = inputs:
        inputs.flake-parts.lib.mkFlake {inherit inputs;}
        (inputs.import-tree ./modules);
}
