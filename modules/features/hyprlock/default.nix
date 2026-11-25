{
    inputs,
    moduleWithSystem,
    ...
}: {
    flake.nixosModules.hyprlock = moduleWithSystem ({self', ...}: {
        environment.systemPackages = with self'.packages; [
            hyprlock
        ];
    });
    perSystem = {pkgs, ...}: {
        packages.hyprlock = inputs.wrapper-modules.wrappers.hyprlock.wrap {
            inherit pkgs;
            "hyprlock.conf".content = ''
                source = ${./mocha.conf}

                $accent = $mauve
                $accentAlpha = $mauveAlpha
                $font = JetBrainsMono Nerd Font

                # GENERAL
                general {
                  hide_cursor = true
                }

                # BACKGROUND
                background {
                  monitor =
                  path = screenshot
                  blur_passes = 3
                  color = rgba(0, 0, 0, 0)
                }

                # TIME
                label {
                  monitor =
                  text = $TIME12
                  color = $text
                  font_size = 90
                  font_family = $font
                  halign = center
                  valign = top
                }

                # DATE
                label {
                  monitor =
                  text = cmd[update:43200000] date +"%A, %B %d, %Y"
                  color = $text
                  font_size = 25
                  font_family = $font
                  position = 0, -150
                  halign = center
                  valign = top
                }

                # CAT BACKGROUND IMAGE
                image {
                  path = ${./cat.png}
                  size = 240
                  border_color = transparent
                  rounding = 0
                  position = 0, 7px
                }

                # USER AVATAR
                image {
                  monitor =
                  path = $HOME/.face
                  size = 100
                  border_color = $accent
                  position = 0, 75
                  halign = center
                  valign = center
                }

                # INPUT FIELD
                input-field {
                  monitor =
                  size = 300, 60
                  outline_thickness = 4
                  dots_size = 0.2
                  dots_spacing = 0.2
                  dots_center = true
                  outer_color = $accent
                  inner_color = $surface0
                  font_color = $text
                  fade_on_empty = false
                  placeholder_text = <span foreground="##$textAlpha"><i>󰌾 Logged in as </i><span foreground="##$accentAlpha">$USER</span></span>
                  hide_input = false
                  check_color = $accent
                  fail_color = $red
                  fail_text = <i>$FAIL <b>($ATTEMPTS)</b></i>
                  capslock_color = $yellow
                  position = 0, -47
                  halign = center
                  valign = center
                }
            '';
        };
    };
}
