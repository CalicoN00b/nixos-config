{ pkgs, ... }:

{
    # services.hyprpaper = {
    #     enable = true;

    #     settings = {
    #         splash = false;

    #         wallpaper = {
    #             monitor = "";
    #             fit_mode = "cover";
    #             path = "~/Pictures/Wallpapers/forest.jpg";
    #         };
    #     };
    # };

    home.packages = [ pkgs.hyprpaper ];

    xdg.configFile."hypr/hyprpaper.conf".text = ''
        wallpaper {
            monitor=
            fit_mode=cover
            path=~/Pictures/Wallpapers/forest.jpg
        }
        splash=false
    '';
}