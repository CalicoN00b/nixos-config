{ self, inputs, moduleWithSystem, ... }:

{
    flake.nixosModules.neovim = moduleWithSystem ({ self', ... }: {
        programs.neovim = {
            enable = true;
            package = self'.packages.neovim;
        };

        environment.sessionVariables = {
            EDITOR = "nvim";
        };
    });

    perSystem = { pkgs, self', ... }: {
        packages.neovim = inputs.wrapper-modules.wrappers.neovim.wrap {
            inherit pkgs;
            settings.config_directory = ./.;
            runtimePkgs = with pkgs; [
                tree-sitter # Required for nvim-treesitter plugin

                # Nix Language Server
                nixd

                # CPP Language Server and Formatter (clangd and clang-format)
                libclang
            ] ++ [
                # Nix Formatter
                self'.packages.alejandra
            ];
        };

        packages.alejandra = inputs.wrapper-modules.lib.wrapPackage {
            inherit pkgs;
            package = pkgs.alejandra;
            flags = let 
                config-file = builtins.toFile "config.toml" ''
                    indentation = "FourSpaces"
                    # space_around_brackets = true
                    # preserve_one_line_attr_sets = false
                '';
            in
            {
                "--experimental-config" = config-file;
            };
        };
    };
}