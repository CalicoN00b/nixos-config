{
    description = "CalicoN00b's NixOS Config";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-26.05";

        home-manager = {
            url = "github:nix-community/home-manager/release-26.05";
            inputs.nixpkgs.follows = "nixpkgs";
        };

        nixvim.url = "github:nix-community/nixvim/nixos-26.05";
    };

    outputs = { self, nixpkgs, nixvim, ... }@inputs:
    let
        username = "MY_USERNAME";
        host = "MY_HOSTNAME";
        system = "x86_64-linux";
        lib = nixpkgs.lib;
        pkgs = import nixpkgs {
            inherit system;
            config = {
                allowUnfree = true;
                allowUnfreePredicate = (_: true);
            };
        };
    in {
        nixosConfigurations = {
            MY_HOSTNAME = lib.nixosSystem {
                inherit system;
                modules = [ ./system ];
                specialArgs = {
                    inherit self inputs username host nixvim;
                };
            };
        };
    };
}
