{ self, inputs, ... }:

{
    flake.nixosModules.networking = { ... }: {
        networking = {
            networkmanager = {
                enable = true;
                dns = "none";
            };

            nameservers = [
                "1.1.1.1"
                "8.8.8.8"
            ];
        };

        services.unbound.enable = true;
        programs.nm-applet.enable = true;
    };
}