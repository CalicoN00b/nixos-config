{ ... }:

{
    services.hyprpaper = {
        enable = true;

        settings = {
            splash = false;

            wallpaper = {
                monitor = "";
                fit_mode = "cover";
                path = "~/Pictures/Wallpapers/forest.jpg";
            };
        };
    };
}