{ pkgs, ... }:

{
    home.packages = [ pkgs.git ];
    programs.git = {
        enable = true;
        userName = "Ian Galaviz";
        userEmail = "brianatthehouse@gmail.com";
        extraConfig = {
            init.defaultBranch = "main";
        };
    };
}