{ pkgs, frc-nix-pkgs, ... }:

{
    home.packages = (with pkgs; [
        kid3
        yt-dlp
        fluffychat

        # Config has to be done through Librewolf settings and about:config
        # Can do (at least some) config through nix, but not a priority.
        librewolf

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
        gdb
        clang-tools
        cmake
        gnumake
    ]) ++ (with frc-nix-pkgs; [
        vscode-wpilib
        advantagescope
        elastic-dashboard
        pathplanner
    ]);
}