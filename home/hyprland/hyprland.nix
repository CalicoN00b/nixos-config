{ pkgs, ... }:

{
    wayland.windowManager.hyprland = {
        enable = true;
        
        configType = "hyprlang";

        xwayland.enable = true;
        systemd.enable = true;
    };

    programs.hyprlock.enable = true;

    home.packages = with pkgs; [
        hyprshutdown
    ];
}