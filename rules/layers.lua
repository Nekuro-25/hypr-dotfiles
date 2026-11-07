-- =========================================================
-- LAYER RULES
-- =========================================================
-- Layer = elemen non-window seperti bar, launcher, notifikasi.
-- Blur di sini membuat latar semi-transparan (Waybar 0.78,
-- Rofi, Mako, SwayOSD) tampil menyatu dengan wallpaper.
--
-- Cek namespace yang sebenarnya dengan:
--     hyprctl layers
--
-- Semua rule dipasang lewat rule() (pcall): satu rule yang tidak
-- cocok dengan versi Hyprland-mu tidak menggagalkan yang lain.
-- =========================================================

local function rule(t)
	local ok, err = pcall(hl.layer_rule, t)
	if not ok then
		print("[layers] rule '" .. tostring(t.name) .. "' dilewati: " .. tostring(err))
	end
end

-- Waybar (termasuk tooltip dan power menu)
rule({
	name = "blur-waybar",
	match = { namespace = "waybar" },
	blur = true,
	blur_popups = true,
	ignore_alpha = 0.2,
})

-- Rofi
rule({
	name = "blur-rofi",
	match = { namespace = "rofi" },
	blur = true,
	ignore_alpha = 0.2,
})

-- Mako (namespace bawaan: "notifications")
rule({
	name = "blur-mako",
	match = { namespace = "notifications" },
	blur = true,
	ignore_alpha = 0.2,
})

-- SwayOSD (popup volume/brightness)
-- Jika tidak ada efeknya, cek namespace dengan `hyprctl layers`.
rule({
	name = "blur-swayosd",
	match = { namespace = "swayosd" },
	blur = true,
	ignore_alpha = 0.2,
})

-- (baru) Notifikasi meluncur masuk dari tepi kanan, bukan sekadar popin
rule({
	name = "anim-mako",
	match = { namespace = "notifications" },
	animation = "slide right",
})

-- (baru) Overlay pemilih area (slurp) & color picker: tanpa animasi
-- supaya terasa instan dan tidak ikut tertangkap saat screenshot.
rule({
	name = "noanim-selection",
	match = { namespace = "^(selection|hyprpicker)$" },
	no_anim = true,
})
