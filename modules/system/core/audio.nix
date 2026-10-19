{ self, inputs, ... }:

{
    flake.nixosModules.audio = { pkgs, ... }: {
        environment.systemPackages = with pkgs; [
            playerctl
            pavucontrol
            pipewire
            pipewire.jack
        ];

        services = {
            pipewire = {
                enable = true;

                pulse.enable = true;
                jack.enable = true;
                wireplumber.enable = true;

                alsa = {
                    enable = true;
                    support32Bit = true;
                };
            };
        };

        hardware.alsa.enablePersistence = true;
        security.rtkit.enable = true;
    };
}