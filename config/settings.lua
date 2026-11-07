-- =========================================================
-- GENERAL SETTINGS
-- =========================================================

local theme = require("config.theme")

-- Warna border aktif: gradien atau solid (lihat config/theme.lua)
local active_colors = theme.border_gradient and { theme.accent, theme.accent2 } or { theme.accent, theme.accent }

-- Opsi tambahan dipasang lewat try(): kalau satu opsi tidak dikenali
-- versi Hyprland-mu, hanya grup itu yang dilewati (tercatat di log),
-- bukan seluruh config.
local function try(tbl)
	local ok, err = pcall(hl.config, tbl)
	if not ok then
		print("[settings] opsi dilewati: " .. tostring(err))
	end
end

-- =========================================================
-- INTI
-- =========================================================

hl.config({
	general = {
		-- Gaps
		gaps_in = theme.gaps_in,
		gaps_out = theme.gaps_out,

		-- Borders
		border_size = theme.border_size,

		-- Stability over minimum latency
		allow_tearing = false,

		-- Primary tiling layout
		layout = "dwindle",

		-- Resize jendela dengan menyeret tepi (selain SUPER + klik kanan)
		resize_on_border = true,
		extend_border_grab_area = 15,
		hover_icon_on_border = true,

		-- Border colors: azure -> ice blue gradient on the focused window
		col = {
			active_border = {
				colors = active_colors,
				angle = theme.gradient_angle,
			},
			inactive_border = {
				colors = { theme.border_inactive_1, theme.border_inactive_2 },
				angle = theme.gradient_angle,
			},
		},
	},

	-- =====================================================
	-- WINDOW DECORATION
	-- =====================================================

	decoration = {
		-- Rounded corners (rounding_power > 2 = sudut lebih "smooth")
		rounding = theme.rounding,
		rounding_power = theme.rounding_power,

		-- Opacity
		-- Kitty sudah punya background_opacity = 0.88. Kalau inactive_opacity
		-- < 1.0, transparansi menumpuk (0.88 x 0.92 ~ 0.81) dan Firefox/video
		-- ikut tembus pandang. Jadi opacity dibiarkan 1.0 dan fokus ditandai
		-- dengan border, glow, dan dim_inactive yang tipis di bawah.
		active_opacity = 1.00,
		inactive_opacity = 1.00,

		-- Redupkan jendela tidak fokus sedikit saja
		dim_inactive = theme.dim_inactive,
		dim_strength = 0.08,

		-- Blur (set enabled = false if it hurts performance)
		blur = {
			enabled = true,
			size = theme.blur_size,
			passes = theme.blur_passes,
			vibrancy = 0.17,
			noise = 0.015,
			brightness = 0.9,
			popups = true,
		},

		-- Bayangan: diatur oleh gaya di config/theme.lua (flat = mati)
		shadow = {
			enabled = theme.shadow_enabled,
			range = theme.shadow_range,
			render_power = theme.shadow_power,
			color = theme.shadow_active,
			color_inactive = theme.shadow_inactive,
		},
	},

	-- =====================================================
	-- MISCELLANEOUS
	-- =====================================================

	misc = {
		-- Wallpaper handled by Hyprpaper
		force_default_wallpaper = 0,

		-- Remove default Hyprland branding
		disable_hyprland_logo = true,

		-- Layar menyala lagi saat tombol/mouse disentuh
		-- (dpms dimatikan lewat scripts/dpms.sh oleh hypridle)
		key_press_enables_dpms = true,
		mouse_move_enables_dpms = true,
	},
})

-- =========================================================
-- DWINDLE
-- =========================================================

hl.config({
	dwindle = {
		-- Preserve split orientation when possible
		preserve_split = true,
	},
})

-- =========================================================
-- MASTER
-- =========================================================
-- Layout alternatif. Dwindle tetap default.
-- NOTE: belum ada keybind untuk berpindah ke layout ini,
-- jadi blok ini baru aktif kalau kamu menambahkan caranya.
-- =========================================================

hl.config({
	master = {
		new_status = "master",
	},
})

-- =========================================================
-- TAMBAHAN (dilindungi pcall)
-- =========================================================

-- Jendela floating "menempel" ke tepi jendela lain / layar saat digeser
try({
	general = {
		snap = {
			enabled = true,
			window_gap = 10,
			monitor_gap = 10,
		},
	},
})

-- Dwindle: jendela baru selalu muncul di kanan/bawah (lebih bisa ditebak)
try({
	dwindle = {
		force_split = 2,
		special_scale_factor = 0.95,
	},
})

-- Dekorasi: scratchpad menggelapkan latar sedikit agar terasa "mengambang"
try({
	decoration = {
		dim_special = 0.3,
		blur = {
			ignore_opacity = true,
			new_optimizations = true,
		},
	},
})

-- Misc: animasi resize/drag manual, anti-flash hitam, pemulihan lockscreen
try({
	misc = {
		font_family = theme.font,
		background_color = theme.bg,
		disable_splash_rendering = true,
		animate_manual_resizes = true,
		animate_mouse_windowdragging = true,
		allow_session_lock_restore = true, -- hyprlock crash -> bisa dipulihkan, bukan layar terbuka
	},
})

-- Binds: tekan SUPER + <angka> workspace yang sama = kembali ke sebelumnya;
-- scroll SUPER + roda mouse lebih responsif (default jeda 300 ms)
try({
	binds = {
		workspace_back_and_forth = true,
		allow_workspace_cycles = true,
		scroll_event_delay = 120,
	},
})

-- Kursor: sembunyi saat mengetik / diam 5 detik
try({
	cursor = {
		inactive_timeout = 5,
		hide_on_key_press = true,
	},
})

-- Matikan pesan update/donasi Hyprland
try({
	ecosystem = {
		no_update_news = true,
		no_donation_nag = true,
	},
})
