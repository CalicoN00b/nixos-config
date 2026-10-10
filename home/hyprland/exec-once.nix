{ ... }:

{
    wayland.windowManager.hyprland.settings.exec-once = [
        # I think I need these two lines in order for Vesktop to work.
        "dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        
        "waybar &"
    ];
}