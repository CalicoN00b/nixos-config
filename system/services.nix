{ ... }:

{
    services = {
        # Enable X11 and configure keymap
        xserver = {
            enable = true;

            xkb = {
                layout = "us";
                variant = "";
            };
        };

        # Enable KDE Plasma DE
        displayManager.sddm.enable = true;
        desktopManager.plasma6.enable = true;

        # Enable CUPS to print documents
        printing.enable = true;

        # Enable sound with pipewire
        pulseaudio.enable = false;
        pipewire = {
            enable = true;

            alsa = {
                enable = true;
                support32Bit = true;
            };

            pulse.enable = true;
        };

        # Enable touchpad support (enabled default in most desktopManager).
        # xserver.libinput.enable = true;

        openssh.enable = true;
        tailscale.enable = true;
    };

    security.rtkit.enable = true;
}