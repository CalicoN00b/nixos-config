{ pkgs, ... }:

{
    users.users.igalaviz = {
        extraGroups = [ "docker" ];
    };

    environment.systemPackages = with pkgs; [
        docker-compose
    ];

    virtualisation = {
        docker.enable = true;
    };
}