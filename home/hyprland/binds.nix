{ ... }:

{
    wayland.windowManager.hyprland.settings = {
        bind = [
            "CTRL ALT, T, exec, kitty"
            "ALT, Space, exec, rofi -show drun"
            "SUPER, Q, killactive,"
            "SUPER, Prior, fullscreen, 0" # PageUp
            "SUPER SHIFT, Prior, fullscreen, 1"

            "SUPER, L, exec, hyprlock"
            "SUPER SHIFT, L, exec, hyprshutdown -t 'Logging out...'"
            "SUPER, Escape, exec, hyprlock & systemctl suspend"
            "SUPER SHIFT, Escape, exec, hyprshutdown -t 'Shutting down...' -p 'shutdown now'"

            "CTRL ALT, up, exec, hyprctl dispatch setfloating active"
            "CTRL ALT, down, exec, hyprctl dispatch settiled active"

            "SUPER, left,  movefocus, l"
            "SUPER, right, movefocus, r"
            "SUPER, up,    movefocus, u"
            "SUPER, down,  movefocus, d"

            "SUPER SHIFT, left, movewindow, l"
            "SUPER SHIFT, right, movewindow, r"
            "SUPER SHIFT, up, movewindow, u"
            "SUPER SHIFT, down, movewindow, d"

            "SUPER CTRL, left, resizeactive, -80 0"
            "SUPER CTRL, right, resizeactive, 80 0"
            "SUPER CTRL, up, resizeactive, 0 -80"
            "SUPER CTRL, down, resizeactive, 0 80"

            "SUPER ALT, left, moveactive,  -80 0"
            "SUPER ALT, right, moveactive, 80 0"
            "SUPER ALT, up, moveactive, 0 -80"
            "SUPER ALT, down, moveactive, 0 80"

            "SUPER, 1, workspace, 1"
            "SUPER, 2, workspace, 2"
            "SUPER, 3, workspace, 3"
            "SUPER, 4, workspace, 4"
            "SUPER, 5, workspace, 5"
            "SUPER, 6, workspace, 6"
            "SUPER, 7, workspace, 7"
            "SUPER, 8, workspace, 8"
            "SUPER, 9, workspace, 9"
            "SUPER, 0, workspace, 10"

            "SUPER SHIFT, 1, movetoworkspace, 1"
            "SUPER SHIFT, 2, movetoworkspace, 2"
            "SUPER SHIFT, 3, movetoworkspace, 3"
            "SUPER SHIFT, 4, movetoworkspace, 4"
            "SUPER SHIFT, 5, movetoworkspace, 5"
            "SUPER SHIFT, 6, movetoworkspace, 6"
            "SUPER SHIFT, 7, movetoworkspace, 7"
            "SUPER SHIFT, 8, movetoworkspace, 8"
            "SUPER SHIFT, 9, movetoworkspace, 9"
            "SUPER SHIFT, 0, movetoworkspace, 10"

            "SUPER CTRL, 1, movetoworkspace, 1"
            "SUPER CTRL, 2, movetoworkspace, 2"
            "SUPER CTRL, 3, movetoworkspace, 3"
            "SUPER CTRL, 4, movetoworkspace, 4"
            "SUPER CTRL, 5, movetoworkspace, 5"
            "SUPER CTRL, 6, movetoworkspace, 6"
            "SUPER CTRL, 7, movetoworkspace, 7"
            "SUPER CTRL, 8, movetoworkspace, 8"
            "SUPER CTRL, 9, movetoworkspace, 9"
            "SUPER CTRL, 0, movetoworkspace, 10"
        ];

        bindm = [
            "SUPER, mouse:272, movewindow"
            "SUPER, mouse:273, resizewindow"
        ];

        gesture = [
            "4, horizontal, workspace"
        ];
    };
}