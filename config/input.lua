-- =========================================================
-- INPUT
-- =========================================================

hl.config({
	input = {
		-- Keyboard
		kb_layout = "us",
		kb_variant = "",
		kb_model = "",
		-- Tips: jadikan CapsLock sebagai Escape (enak untuk Neovim):
		--   kb_options = "caps:escape",
		kb_options = "",
		kb_rules = "",

		-- Key repeat: lebih responsif (default 25 / 600)
		repeat_rate = 35,
		repeat_delay = 250,
		numlock_by_default = true,

		-- Pointer focus
		follow_mouse = 1,

		-- Default sensitivity
		sensitivity = 0,

		-- Touchpad
		touchpad = {
			natural_scroll = true,
			tap_to_click = true, -- ketuk = klik
			disable_while_typing = true, -- cegah kursor loncat saat mengetik
			clickfinger_behavior = true, -- 2 jari = klik kanan, 3 jari = klik tengah
		},
	},
})

-- Swipe 3 jari ke kiri/kanan untuk pindah workspace
hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace" })
