{ self, inputs, ... }:

{
    flake.nixosModules.bootloader = { pkgs, ... }: {
        boot = {
            loader = {
                grub = {
                    enable = true;
                    device = "nodev";
                    efiSupport = true;
                    theme = pkgs.catppuccin-grub;
                };

                efi.canTouchEfiVariables = true;
            };

            plymouth = {
                enable = true;

                theme = "catppuccin-mocha";
                themePackages = [
                    (pkgs.catppuccin-plymouth.override {
                        variant = "mocha";
                    })
                ];
            };

            # Enable "Silent boot"
            consoleLogLevel = 3;
            initrd.verbose = false;
            kernelParams = [
                "quiet"
                "splash"
                "rd.udev.log_level=3"
                "rd.systemd.show_status=auto"
            ];

            kernelPackages = pkgs.linuxPackages_latest;
        };
    };
}