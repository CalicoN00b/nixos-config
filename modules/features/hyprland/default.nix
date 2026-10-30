{ self, inputs, moduleWithSystem, ... }:

{
    flake.nixosModules.hyprland = moduleWithSystem ({ self', ... }: {
        programs.hyprland = {
            enable = true;
            package = self'.packages.hyprland;
        };

        environment.sessionVariables = {
            NIXOS_OZONE_WL = 1;
        };
    });

    perSystem = { pkgs, self', ... }: {
        packages.hyprland = inputs.wrapper-modules.wrappers.hyprland.wrap {
            inherit pkgs;

            runtimePkgs = with self'.packages; ([
                { data = kitty; prefix = true; }
                { data = rofi; prefix = true; }
                { data = hyprpaper; prefix = true; }
                { data = quickshell; prefix = true; }
            ]) ++ (with pkgs; [
                hyprlock # Temporary, will be packaged into self'.packages
            ]);

            "hyprland.lua".content = ''
                require("config")
                require("binds")
                require("autostart")
                require("animations")

                local handle = io.popen("hostname")
                local hostname = "twinkbook" -- Default fallback

                -- If there is a hostname at all
                if handle then
                    local result = handle:read("*l") -- Read the first line
                    handle:close()
                    if result then
                        Hostname = result:gsub("%s+", "") -- Remove whitespace/newlines
                    end
                end

                require(hostname)
            '';

            lua.dirs = [
                ./modules
                ./hosts
            ];
        };
    };
}