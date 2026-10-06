{ ... }:

{
    wayland.windowManager.hyprland.settings = {
        "$mod" = "SUPER";

        monitor = [ ",1920x1200,auto,auto" ];

        input = {
            touchpad = {
                disable_while_typing = false;
                natural_scroll = true;
            };
        };

        misc = {
            disable_hyprland_logo = true;
            disable_splash_rendering = true;
            disable_autoreload = false;
        };

        bind = [
            "CTRL ALT, T, exec, kitty"
            "ALT, Space, exec, rofi -show drun"
        ];
    };
}