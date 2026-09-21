{ pkgs, lib, ... }:

{
    programs = {
        zsh = {
            enable = true;
            initContent = lib.mkOrder 1500 ''
                export JAVA_HOME=${pkgs.jdk}/lib/openjdk 
            '';
        };
    };
}