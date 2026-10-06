{ ... }:

{
    wayland.windowManager.hyprland.settings = {
        monitor = [ ",1920x1200,auto,1" ];

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
            focus_on_activate = true;
            middle_click_paste = false;
        };
    };
}