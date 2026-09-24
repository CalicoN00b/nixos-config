{ pkgs, ... }:

{
    # Don't use programs.vesktop.enable
    # so we can manually override the settings.json with ours.
    home.packages = [ pkgs.vesktop ];

    xdg.configFile."vesktop/settings.json".source = ./vencord-settings.json;
}