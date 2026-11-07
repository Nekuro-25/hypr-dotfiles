-- =========================================================
-- ROFI MENU KEYBINDS
-- =========================================================
-- Menu bertema Rofi. Skrip ada di ~/.config/rofi/scripts/.
-- =========================================================

local mainMod = "SUPER"
local menus = "~/.config/rofi/scripts"

-- SUPER + X → Power menu
hl.bind(mainMod .. " + X", hl.dsp.exec_cmd(menus .. "/power-menu.sh"), {
	description = "Power menu",
})

-- SUPER + S → Screenshot menu
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd(menus .. "/screenshot-menu.sh"), {
	description = "Screenshot menu",
})

-- SUPER + N → Wi-Fi menu
hl.bind(mainMod .. " + N", hl.dsp.exec_cmd(menus .. "/wifi-menu.sh"), {
	description = "Wi-Fi menu",
})

-- SUPER + B → Bluetooth menu
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(menus .. "/bluetooth-menu.sh"), {
	description = "Bluetooth menu",
})

-- SUPER + F1 → Cheat sheet semua keybind (dibaca otomatis dari config)
hl.bind(mainMod .. " + F1", hl.dsp.exec_cmd("~/.config/hypr/scripts/keybinds-help.sh"), {
	description = "Show keybind cheat sheet",
})
