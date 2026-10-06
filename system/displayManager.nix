{ username, ... }:

{
    services.displayManager = {
        sddm.enable = true;

        autoLogin = {
            enable = true;
            user = "${username}";
        };

        defaultSession = "plasma";
    };

    # Enable Hyprland and KDE Plasma 6 as options
    programs.hyprland.enable = true;
    services.desktopManager.plasma6.enable = true;
}