{ self, inputs, ... }:

{
    flake.nixosModules.core = { pkgs, ... }: {
        imports = with self.nixosModules; [
            bootloader
            nix-settings
            user
            networking
            locale
            battery
            audio
            sddm
        ];

        # Misc services that should be enabled on all machines
        services = {
            openssh.enable = true;
            tailscale.enable = true;
            printing.enable = true;
        };

        # Misc programs that should be enabled on all machines
        programs = {
            localsend.enable = true;
        };

        # Misc packages that should be installed on all machines
        environment.systemPackages = with pkgs; [
            # Browser
            librewolf

            # Communication
            fluffychat
            vesktop

            devenv
        ];
    }
}