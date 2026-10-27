hl.on("hyprland.start", function()
    hl.exec_cmd("dbus-update-activation-environment --all --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
    hl.exec_cmd("hyprpaper") -- no need for & at the end bc of how hl.exec_cmd works
    hl.exec_cmd("quickshell")
end)