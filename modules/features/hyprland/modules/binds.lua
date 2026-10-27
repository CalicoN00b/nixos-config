local mainMod = "SUPER"

hl.bind("CONTROL + ALT + T", hl.dsp.exec_cmd("kitty", { float = true }))
hl.bind("CONTROL + ALT + V", hl.dsp.exec_cmd("[vesktop --enable-features=UseOzonePlatform --ozone-platform=wayland", { workspace = 10 }))
hl.bind("ALT + SPACE", hl.dsp.exec_cmd("rofi -show drun"))

hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))

hl.bind(mainMod .. " + Prior", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle"}))
hl.bind(mainMod .. " + SHIFT + Prior", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle"}))

for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.focus({ workspace = i, follow = true }))
    hl.bind(mainMod .. " + CONTROL + " .. key, hl.dsp.focus({ workspace = i, follow = false }))
end

hl.bind(mainMod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + SHIFT + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + SHIFT + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + SHIFT + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + SHIFT + down", hl.dsp.focus({ direction = "down" }))

hl.bind(mainMod .. " + CONTROL + left", hl.dsp.window.resize({ x = -80, y = 0, relative = true}))
hl.bind(mainMod .. " + CONTROL + right", hl.dsp.window.resize({ x = 80, y = 0, relative = true}))
hl.bind(mainMod .. " + CONTROL + up", hl.dsp.window.resize({ x = 0, y = -80, relative = true}))
hl.bind(mainMod .. " + CONTROL + down", hl.dsp.window.resize({ x = 0, y = 80, relative = true}))

hl.bind(mainMod .. " + ALT + left", hl.dsp.window.move({ x = -80, y = 0, relative = true}))
hl.bind(mainMod .. " + ALT + right", hl.dsp.window.move({ x = 80, y = 0, relative = true}))
hl.bind(mainMod .. " + ALT + up", hl.dsp.window.move({ x = 0, y = -80, relative = true}))
hl.bind(mainMod .. " + ALT + down", hl.dsp.window.move({ x = 0, y = 80, relative = true}))

hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true })
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -e4 -n2  5%+"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -e4 -n2 5%-"), { repeating = true })

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.gesture({ fingers = 4, direction = "horizontal", action = "workspace" })

hl.bind(mainMod .. " + L", hl.dsp.exec_cmd("hyprlock"))
-- Logout submap may be replaced by wlogout, uncertain
hl.bind("CONTROL + ALT + Delete", hl.dsp.submap("logout"))

hl.on("keybinds.submap", function(name)
	if name == "logout" then
		hl.notification.create({
			text = "l - Logout\ns - Suspend\np - Poweroff\nr - Reboot\nEsc - Cancel",
			duration = 3000,
			color = "rgb(CBA6F7)", -- Catppuccin Mocha Mauve
			font_size = 18,
		})
	end
end)

hl.define_submap("logout", function()
	hl.bind("l", function()
		hl.dispatch(hl.dsp.submap("reset"))
		hl.dispatch(hl.dsp.exec_cmd("hyprctl dismissnotify"))
		hl.dispatch(hl.dsp.exit())
	end)
	hl.bind("s", function()
		hl.dispatch(hl.dsp.submap("reset"))
		hl.dispatch(hl.dsp.exec_cmd("hyprctl dismissnotify"))
		hl.dispatch(hl.dsp.exec_cmd("hyprlock & systemctl suspend"))
	end)
	hl.bind("p", function()
		hl.dispatch(hl.dsp.submap("reset"))
		hl.dispatch(hl.dsp.exec_cmd("hyprctl dismissnotify"))
		hl.dispatch(hl.dsp.exec_cmd("systemctl poweroff"))
	end)
	hl.bind("r", function()
		hl.dispatch(hl.dsp.submap("reset"))
		hl.dispatch(hl.dsp.exec_cmd("hyprctl dismissnotify"))
		hl.dispatch(hl.dsp.exec_cmd("systemctl reboot"))
	end)
	hl.bind("Escape", function()
		hl.dispatch(hl.dsp.exec_cmd("hyprctl dismissnotify"))
		hl.dispatch(hl.dsp.submap("reset"))
	end)
end)