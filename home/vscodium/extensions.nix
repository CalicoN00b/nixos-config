{ pkgs, ... }:

{
    programs.vscodium.profiles.default.extensions = with pkgs.vscode-extensions; [
        # Extension Pack for Java
        vscjava.vscode-java-pack # Technically unnecessary but VSCodium will bug you to install it.
        redhat.java
        vscjava.vscode-java-debug
        vscjava.vscode-java-test
        vscjava.vscode-maven
        vscjava.vscode-gradle
        vscjava.vscode-java-dependency
        visualstudioexptteam.vscodeintellicode

        # Nix
        bbenoist.nix

        # C/C++
        ms-vscode.cpptools # I know it's Microsoft, sorry.
    ];
}