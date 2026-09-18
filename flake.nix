{
    description = "Ian's Flake";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-26.05";
        home-manager.url = "github:nix-community/home-manager/release-26.05";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
        nixvim.url = "github:nix-community/nixvim/nixos-26.05";
        nixvim.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = { self, nixpkgs, home-manager, nixvim, ... }:
    let
        system = "x86_64-linux";
        lib = nixpkgs.lib;
        pkgs = import nixpkgs {
            system = "x86_64-linux";
            config = {
                allowUnfree = true;
                allowUnfreePredicate = (_: true);
            };
        };
    in {
        nixosConfigurations = {
            twinkbook = lib.nixosSystem {
                inherit system;
                modules = [ ./configuration.nix ];
            };
        };

        homeConfigurations = {
            igalaviz = home-manager.lib.homeManagerConfiguration {
                inherit pkgs;
                extraSpecialArgs = { inherit nixvim; };
                modules = [ ./home.nix ];
            };
        };
    };
}
