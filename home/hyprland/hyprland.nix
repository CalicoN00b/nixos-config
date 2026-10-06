{ ... }:

{
    wayland.windowManager.hyprland = {
        enable = true;
        
        configType = "hyprlang";

        xwayland.enable = true;
        systemd.enable = true;
    };
}