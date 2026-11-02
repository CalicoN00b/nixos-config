{ self, inputs, moduleWithSystem, ... }:

{
    flake.nixosModules.neovim = moduleWithSystem ({ self', ... }: {
        program.neovim = {
            enable = true;
            package = self'.packages.neovim;
        };

        environment.sessionVariables = {
            EDITOR = "nvim";
        };
    });

    perSystem = { pkgs, ... }: {
        packages.neovim = inputs.wrapper-modules.wrappers.neovim.wrap {
            inherit pkgs;
            settings.config_directory = ./.;
            runtimePkgs = with pkgs; [
                # Nix Language Server and Formatter
                nixd
                alejandra

                # CPP Language Server and Formatter (clangd and clang-format)
                libclang
            ];
        };
    };
}