{ ... }:

{
    programs.waybar.style = ''
        * {
            font-family: JetBrainsMono Nerd Font;
            font-size: 14px;
        }

        #tray {
            margin-left: 15px;
        }

        #clock {
            margin-right: 5px;
        }

        #network, #pulseaudio, #battery {
            margin-right: 15px;
        }
    '';
}