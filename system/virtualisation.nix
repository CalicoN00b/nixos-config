{ pkgs, username, ... }:

{
    users.users.${username}.extraGroups = [
        "docker" 
        "libvirtd"
    ];

    environment.systemPackages = with pkgs; [
        docker-compose

        virt-manager
        virt-viewer
        spice
        spice-gtk
        spice-protocol
        virtio-win
        win-spice
        adwaita-icon-theme
    ];

    virtualisation = {
        docker.enable = true;

        libvirtd = {
            enable = true;
            qemu = {
                swtpm.enable = true;
            };
        };

        spiceUSBRedirection.enable = true;
    };

    services.spice-vdagentd.enable = true;
}