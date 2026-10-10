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

        # Enable CUPS to print documents
        printing.enable = true;

        # Enable sound with pipewire
        pipewire = {
            enable = true;

            pulse.enable = true;
            wireplumber.enable = true;

            alsa = {
                enable = true;
                support32Bit = true;
            };
        };

        openssh.enable = true;
        tailscale.enable = true;
    };

    hardware.alsa.enablePersistence = true;
    security.rtkit.enable = true;
}