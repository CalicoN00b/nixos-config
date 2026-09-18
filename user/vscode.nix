{ pkgs, lib, ... }:

{
    home.packages = with pkgs; [
        vscode
        jdk
    ];

    programs.vscode = {
        enable = true;
        profiles = {
            Java = {
                extensions = with pkgs.vscode-extensions; [
                    # Extension Pack for Java
                    vscjava.vscode-java-pack # Install this so VSCode doesn't bug you to install it
                    redhat.java
                    vscjava.vscode-java-debug
                    vscjava.vscode-java-test
                    vscjava.vscode-maven
                    vscjava.vscode-gradle
                    vscjava.vscode-java-dependency
                    visualstudioexptteam.vscodeintellicode
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
                extensions = with pkgs.vscode-extensions; [
                    bbenoist.nix
                ];

                userSettings = {
                    "explorer.compactFolders" = false;
                    "terminal.integrated.fontFamily" = "'JetBrainsMono Nerd Font'";
                    "terminal.integrated.fontLigatures.enabled" = true;
                    "terminal.integrated.fontSize" = 16;
                    "workbench.secondarySideBar.defaultVisibility" = "hidden";
                }
            };

            # Need to add profiles for C++ and CS3505
        };
    };

    programs.gradle.enable = true;
}
