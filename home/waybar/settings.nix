{ ... }:

{
    programs.waybar.settings.mainBar = {
        position = "top";
        layer = "top";
        spacing = 4;

        modules-left = [
            "hyprland/workspaces"
            "tray"
        ];

        modules-center = [];

        modules-right = [
            "network"
            "pulseaudio"
            "battery"
            "clock"
        ];

        "hyprland/workspaces" = {
            active-only = false;
            disable-scroll = true;
            format = "{icon}";
            format-icons = {
                "1" = "1";
                "2" = "2";
                "3" = "3";
                "4" = "4";
                "5" = "5";
                "6" = "6";
                "7" = "7";
                "8" = "8";
                "9" = "9";
                "10" = "10";
                sort-by-number = true;
            };
        };

        tray = {
            icon-size = 21;
            spacing = 10;
        };

        network = {
            format-wifi = "{essid} ({signalStrength}%) 󰖩 "; # f05a9
            format-ethernet = " "; # ef09
            format-disconnected = "󰖪 "; # f05aa
            format-linked = "{ifname} (No IP)";
            tooltip-format = "{ifname} via {gwaddr}";
            tooltip = true;
            interval = 5;
        };

        pulseaudio = {
            format = "{icon} {volume}%";
            format-muted = "󰖁  {volume}%"; # f0581

            format-icons = {
                default = [
                    "󰕿 " # f057f
                    "󰖀 " # f580
                    "󰕾 " # f057e
                ];
            };
        };

        battery = {
            states = {
                critical = 10;
            };
            format = "{icon} {capacity}%";
            format-icons = {
                default = [
                    " " # f243
                    " " # f242
                    " " # f241
                ];
            };
            format-full = "  {capacity}%"; # f240
            format-critical = "  {capacity}%"; # f244
            format-charging = "󰂄 {capacity}%"; # f0084
            format-time = "{H}h {M}m";
            tooltip = true;
            tooltip-format = "{time}";
            interval = 5;
        };

        clock = {
            format = "{:%I:%M %p}";
            format-alt = "{:%m/%d/%Y}";
            tooltip = true;
            tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };
    };
}