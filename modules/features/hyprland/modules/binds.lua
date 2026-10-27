local mainMod = "SUPER"

hl.bind("CONTROL + ALT + T", hl.dsp.exec_cmd("kitty", { float = true }))
hl.bind("CONTROL + ALT + V", hl.dsp.exec_cmd("[vesktop --enable-features=UseOzonePlatform --ozone-platform=wayland", { workspace = 10 }))
hl.bind("ALT + SPACE", hl.dsp.exec_cmd("rofi -show drun"))

hl.bind(mainMod .. " + Q", hl.dsp.close())
hl.bind(mainMod .. " + F", hl.dsp.window.float({ action = "toggle" }))

hl.bind(mainMod .. " + Prior", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle"}))
hl.bind(mainMod .. " + SHIFT + Prior", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle"}))

for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.focus({ workspace = i, follow = true }))
    hl.bind(mainMod .. " + CONTROL + " .. key, hl.dsp.focus({ workspace = i, follow = false }))
end

