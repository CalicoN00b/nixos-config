hl.config({
    general = {
        gaps_in = 2,
        gaps_out = 5,

        border_size = 2,

        col = {
            active_border = { colors = {"rgba(cba6f7ff)", "rgba(b4befeff)"}, angle = 45 }, -- Catppuccin Mocha Mauve & Lavender
            inactive_border = "rgba(1e1e2eaa)", -- Catppuccin Mocha Base @ 2/3 opacity
        },

        resize_on_border = false,
        allow_tearing = false,
        layout = "dwindle",
        resize_corner = 1; -- Top left corner
    },

    decoration = {
        rounding = 10,
        rounding_power = 2.0,

        active_opacity = 1.0,
        inactive_opacity = 0.9,

        shadow = {
            enabled = false,
        },

        -- Will maybe figure out non-default values later
        blur = {
            enabled = true,
        },

        -- Will maybe figure out non-default values later
        -- wobble = {
        --     enabled = true,
        -- },
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        force_split = 2 ,-- New windows split to the right
        preserve_split = true,
    },

    input = {
        kb_layout  = "us",
        kb_variant = "",
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,
        sensitivity = 0.0,
        
        touchpad = {
            natural_scroll = true,
            disable_while_typing = false,
        },
    },

    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        font_family = "JetBrainsMono Nerd Font",
        disable_autoreload = false,
        focus_on_activate = true,
        middle_click_paste = false,
    },

    ecosystem = {
        no_update_news = true,
        no_donation_nag = true,
    },
})

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")