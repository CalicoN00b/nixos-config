{ pkgs, ... }:

{
    home.packages = with pkgs; [
        kid3

        # Config has to be done through Librewolf settings and about:config
        # Can do (at least some) config through nix, but not a priority.
        librewolf

        # Config currently in imperative-configs/vesktop
        # Can do config through nix, but not a priority.
        vesktop # Discord with Vencord preinstalled

        # Config has to be done in Obsidian settings
        # Can do (at least some) config through nix, but not a priority.
        obsidian

        # Config currently in imperative-configs/yazi/
        # Would like to do through nix, but not a priority.
        yazi

        # For telescope.nvim
        ripgrep
        fd

        # CS 3810
        mars-mips

        # C & C++ stuff
        gcc
        libgcc
        gnumake
    ];
}