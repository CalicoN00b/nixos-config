{ ... }:

{
    programs.waybar.style = ''
        * {
            font-family: JetBrainsMono Nerd Font, monospace;
            font-size: 14px;
        }

        window#waybar {
            background-color: transparent;
            color: white;
        }

        #workspaces, #tray, #network, #pulseaudio, #battery, #clock {
            background-color: rgba(43, 48, 59, 1);
            padding: 0 8px;
            border: 2px solid;
            border-radius: 15px;
        }

        #workspaces {
            margin-right: 5px;
        }

        #clock {
            margin-left: 5px;
        }

        #tray, #network, #pulseaudio, #battery {
            margin: 0 5px;
        }

        #network.disconnected {
            border: 2px dashed;
            color: red;
        }

        #pulseaudio.muted {
            border: 2px dashed;
            color: red;
        }

        #battery.critical {
            border: 2px dashed;
            color: red;
        }

        #battery.charging {
            color: orange;
        }

        #battery.full {
            color: lawngreen;
        }
    '';
}