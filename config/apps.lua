-- =========================================================
-- APPLICATION COMMANDS
-- =========================================================
-- Centralized application commands.
-- Change applications here without touching keybinds.
-- =========================================================

local apps = {
	terminal = "kitty",
	fileManager = "thunar",
	browser = "firefox",
	menu = "pkill -x rofi || rofi -show drun", -- tekan lagi untuk menutup
}

return apps
