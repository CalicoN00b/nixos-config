{ pkgs, ... }:

{
    programs.vscodium.profiles.default.userSettings = {
        # General settings
        "update.mode" = "none";
        "extensions.autoUpdate" = false;
        "extensions.autoCheckUpdates" = false;
        "explorer.compactFolders" = false;
        "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font'";
        "terminal.integrated.fontLigatures.enabled" = true;
        "terminal.integrated.fontSize" = 14;
        "terminal.integrated.initialHint" = false;
        "workbench.secondarySideBar.defaultVisibility" = "hidden";

        # Java related settings
        "java.jdt.ls.java.home" = "${pkgs.jdk}/lib/openjdk";
        "java.configuration.runtimes" = [
            {
                "name" = "JavaSE-21";
                "path" = "${pkgs.jdk}/lib/openjdk";
                "default" = false;
            }
        ];
        "redhat.telemetry.enabled" = false;

        # Theme settings
        "workbench.colorTheme" = "Catppuccin Mocha";
        "workbench.iconTheme" = "catppuccin-mocha";      
    };
}