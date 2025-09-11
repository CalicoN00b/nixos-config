{ pkgs, lib, ... }:

{
    home.packages = with pkgs; [
        vscode
        jdk
    ];

    programs.vscode = {
        enable = true;
        profiles = {
            Ian = {
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
                    # Extension Pack for Python
                    ms-python.python
                    ms-python.vscode-pylance
                    ms-python.debugpy
                    # Nix Language Support
                    bbenoist.nix
                ];
                userSettings = {
                    java.jdt.ls.java.home = "${pkgs.jdk}/lib/openjdk";
                    java.configuration.runtimes = {
                        name = "JavaSE-21";
                        path = "${pkgs.jdk}/lib/openjdk";
                        default = true;
                    };
                    explorer.compactFolders = false;
                    terminal.integrated.fontFamily = "'3270 Nerd Font'";
                    terminal.integrated.fontSize = 16;
                    workbench.secondarySideBar.defaultVisibility = false;
                    redhat.telemetry.enabled = false;
                };
            };
        };
    };
}
