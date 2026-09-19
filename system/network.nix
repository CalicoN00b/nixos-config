{ host, ... }:

{
    networking = {
        hostname = "${host}";
        networkmanager.enable = true;
    };
}