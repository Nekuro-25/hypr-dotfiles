-- =========================================================
-- GAME MODE (SUPER + F10)
-- =========================================================
-- Toggle cepat untuk performa maksimum: matikan animasi, blur,
-- shadow, gap, dan rounding. Tekan lagi untuk mengembalikan
-- semuanya ke nilai di config/theme.lua.
--
-- Dibungkus pcall: kalau versi Hyprland-mu tidak menerima fungsi
-- Lua sebagai aksi bind, hanya keybind ini yang dilewati.
-- =========================================================

local theme = require("config.theme")

local enabled = false

local function notify(title, body)
	hl.exec_cmd("notify-send -a 'Game mode' '" .. title .. "' '" .. body .. "'")
end

local function toggle()
	enabled = not enabled

	if enabled then
		hl.config({
			animations = { enabled = false },
			general = { gaps_in = 0, gaps_out = 0, border_size = 1 },
			decoration = {
				rounding = 0,
				dim_inactive = false,
				blur = { enabled = false },
				shadow = { enabled = false },
			},
		})
		notify("Game mode ON", "Animasi, blur, shadow, dan gap dimatikan")
	else
		hl.config({
			animations = { enabled = true },
			general = {
				gaps_in = theme.gaps_in,
				gaps_out = theme.gaps_out,
				border_size = theme.border_size,
			},
			decoration = {
				rounding = theme.rounding,
				dim_inactive = theme.dim_inactive,
				blur = { enabled = true },
				shadow = { enabled = theme.shadow_enabled },
			},
		})
		notify("Game mode OFF", "Tampilan dikembalikan")
	end
end

local ok, err = pcall(hl.bind, "SUPER + F10", toggle, {
	description = "Toggle game mode (no animations/blur)",
})
if not ok then
	print("[gamemode] bind dilewati: " .. tostring(err))
end
