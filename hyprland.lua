-- =========================================================
-- HYPRLAND CONFIGURATION
-- =========================================================
-- Main entry point for the modular Hyprland configuration.
--
-- Setiap modul dimuat lewat pcall: kalau satu file error, modul
-- lain tetap jalan (sesi tidak mati total) dan kamu mendapat
-- notifikasi + baris log (hyprctl rollinglog).
-- Cek kelengkapan file dengan: rice-doctor
-- =========================================================

local failed = {}

local function shq(s)
	return "'" .. tostring(s):sub(1, 300):gsub("'", "'\\''") .. "'"
end

local function safe_require(mod)
	local ok, err = pcall(require, mod)
	if not ok then
		failed[#failed + 1] = mod .. ": " .. tostring(err)
		print("[hyprland.lua] gagal memuat '" .. mod .. "': " .. tostring(err))
	end
end

local modules = {
	-- Core configuration
	"config.environment",
	"config.apps",
	"config.autostart",
	"config.settings",
	"config.input",
	"config.animations",

	-- Keybindings
	"keybinds.applications",
	"keybinds.navigation",
	"keybinds.window",
	"keybinds.workspace",
	"keybinds.hardware",
	"keybinds.media",
	"keybinds.session",
	"keybinds.screenshot",
	"keybinds.notifications",
	"keybinds.clipboard",
	"keybinds.scratchpad",
	"keybinds.menus", -- SUPER + X / S / N / B / F1 (menu Rofi + cheat sheet)
	"keybinds.gamemode", -- SUPER + F10 (matikan animasi/blur)

	-- Window & layer rules
	"rules.windows",
	"rules.layers", -- blur untuk Waybar, Rofi, Mako, SwayOSD
}

for _, mod in ipairs(modules) do
	safe_require(mod)
end

-- Beri tahu kalau ada modul yang gagal (jeda 3 detik supaya mako sudah siap saat login)
if #failed > 0 then
	hl.exec_cmd(
		"sleep 3; notify-send -u critical -a Hyprland 'Config error ("
			.. #failed
			.. " modul)' "
			.. shq(table.concat(failed, "\n"))
	)
end
