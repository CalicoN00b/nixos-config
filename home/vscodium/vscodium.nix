{ pkgs, lib, ... }:

{
    home.packages = with pkgs; [
        jdk
    ];

    programs.vscodium = {
        enable = true;
        profiles = {
            Java = {
                extensions = with pkgs.vscode-extensions; [
                    
                ];

                userSettings = {
                    "java.jdt.ls.java.home" = "${pkgs.jdk}/lib/openjdk";
                    "java.configuration.runtimes" = [
                        {
                            "name" = "JavaSE-21";
                            "path" = "${pkgs.jdk}/lib/openjdk";
                            "default" = false;
                        }
                    ];
                    "explorer.compactFolders" = false;
                    "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font'";
                    "terminal.integrated.fontLigatures.enabled" = true;
                    "terminal.integrated.fontSize" = 16;
                    "workbench.secondarySideBar.defaultVisibility" = "hidden";
                    "redhat.telemetry.enabled" = false;
                };
            };

            Nix = {

                userSettings = {
                    "explorer.compactFolders" = false;
                    "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font'";
                    "terminal.integrated.fontLigatures.enabled" = true;
                    "terminal.integrated.fontSize" = 16;
                    "workbench.secondarySideBar.defaultVisibility" = "hidden";
                };
            };

            # Need to add profiles for C++ and CS3505
        };
    };

    programs.gradle.enable = true;
}
