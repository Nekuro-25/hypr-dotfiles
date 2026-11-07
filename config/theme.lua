-- =========================================================
-- THEME — ICE BLUE NIGHT
-- =========================================================
-- Satu-satunya sumber warna & geometri untuk Hyprland. Palet sama
-- dengan Kitty, Waybar, Rofi, Hyprlock, dan Neovim (ice-night).
-- Dipakai dengan:
--     local theme = require("config.theme")
-- Format warna: rgba(RRGGBBAA)
-- =========================================================

-- ---------------------------------------------------------
-- GAYA BORDER — ganti satu kata ini, lalu reload (SUPER+SHIFT+R)
-- ---------------------------------------------------------
--   "flat" : border 2px tajam, TANPA bayangan/glow (bersih, tegas)
--   "soft" : bayangan netral tipis (hitam) hanya di jendela fokus,
--            memberi kesan kedalaman tanpa halo berwarna
--   "glow" : halo biru lembut di sekeliling jendela fokus
local style = "flat"

-- Border aktif: true = gradien azure -> biru es, false = satu warna solid
local border_gradient = true

local styles = {
	flat = {
		shadow_enabled = false,
		shadow_range = 0,
		shadow_power = 4,
		shadow_active = "rgba(00000000)",
		shadow_inactive = "rgba(00000000)",
	},
	soft = {
		shadow_enabled = true,
		shadow_range = 10,
		shadow_power = 4, -- makin besar = tepi bayangan makin tajam
		shadow_active = "rgba(00000070)",
		shadow_inactive = "rgba(00000000)", -- jendela tidak fokus: tanpa bayangan
	},
	glow = {
		shadow_enabled = true,
		shadow_range = 18,
		shadow_power = 3,
		shadow_active = "rgba(5d80e466)",
		shadow_inactive = "rgba(00000066)",
	},
}

local theme = {
	-- Dasar
	bg = "rgba(141d48ff)",
	bg_alt = "rgba(1b2658ff)",
	fg = "rgba(dbe6ffff)",
	muted = "rgba(9aabe0ff)",

	-- Aksen
	accent = "rgba(5d80e4ff)", -- azure (biru utama; selaras navy wallpaper)
	accent_hi = "rgba(8fa8f2ff)", -- periwinkle
	accent2 = "rgba(a8c4ffff)", -- biru es

	-- Border jendela. Inactive sengaja OPAK: border transparan di atas
	-- latar yang di-blur tampak keruh/"berkabut".
	border_inactive_1 = "rgba(34447fff)",
	border_inactive_2 = "rgba(24315fff)",
	border_gradient = border_gradient,

	-- Geometri
	gaps_in = 5,
	gaps_out = 14,
	rounding = 12,
	rounding_power = 3, -- 2 = lingkaran biasa, >2 = sudut "squircle" ala iOS
	border_size = 2,
	gradient_angle = 45,

	-- Efek
	blur_size = 7,
	blur_passes = 2,
	dim_inactive = true,

	-- Font (dipakai misc.font_family)
	font = "JetBrainsMono Nerd Font",
}

-- Terapkan preset gaya (nama tak dikenal -> jatuh ke "flat")
for k, v in pairs(styles[style] or styles.flat) do
	theme[k] = v
end

return theme
