{ pkgs, ... }:

{
    fonts = {
        fontconfig = {
            enable = true;

            defaultFonts = {
                monospace = [
                    "JetBrainsMono Nerd Font"
                ];
            };
        };

        packages = with pkgs; [
            nerd-fonts.jetbrains-mono
        ];
    };
}