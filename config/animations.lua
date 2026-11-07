-- =========================================================
-- ANIMATIONS
-- =========================================================
-- Karakter: jendela baru "memantul" halus (overshoot), semua
-- gerakan lain berhenti mulus (ease-out), layer (Rofi/OSD)
-- muncul dengan fade. Satuan speed = 100 ms (5 = 0,5 detik).
--
-- Sengaja TIDAK memakai "borderangle" (gradien border berputar
-- terus): memaksa render ulang konstan dan boros baterai.
--
-- Catatan: nama "default" di bawah BUKAN typo dan TIDAK perlu
-- didefinisikan ulang — Hyprland menyediakan bezier bernama
-- "default" secara built-in (0.00, 0.75, 0.15, 1.00), terverifikasi
-- via `hyprctl animations` di Hyprland 0.57.1.
-- =========================================================

-- ---------------------------------------------------------
-- CURVES
-- ---------------------------------------------------------
local function bezier(name, x1, y1, x2, y2)
	hl.curve(name, {
		type = "bezier",
		points = {
			{ x1, y1 },
			{ x2, y2 },
		},
	})
end

bezier("quick", 0.15, 0, 0.10, 1)
bezier("easeOutQuint", 0.23, 1, 0.32, 1)
bezier("easeOutExpo", 0.16, 1, 0.30, 1) -- pengereman sangat halus
bezier("easeInOutCubic", 0.65, 0, 0.35, 1)
bezier("overshoot", 0.34, 1.30, 0.64, 1) -- melewati 100% sedikit lalu kembali
bezier("almostLinear", 0.50, 0.50, 0.75, 1)

-- ---------------------------------------------------------
-- HELPER
-- ---------------------------------------------------------
local function anim(leaf, speed, curve, style)
	hl.animation({
		leaf = leaf,
		enabled = true,
		speed = speed,
		bezier = curve,
		style = style, -- nil = tanpa style khusus
	})
end

-- Global (fallback untuk leaf yang tidak diatur di bawah)
-- "default" = bezier bawaan Hyprland (0.00, 0.75, 0.15, 1.00)
anim("global", 8, "default")

-- ---------------------------------------------------------
-- WINDOWS
-- ---------------------------------------------------------
anim("windows", 5, "easeOutQuint")
anim("windowsIn", 5, "overshoot", "popin 80%") -- jendela baru: pop + pantul halus
anim("windowsOut", 3.5, "easeOutQuint", "popin 85%") -- tutup: mengecil cepat
anim("windowsMove", 4.5, "easeOutExpo") -- geser/resize/relayout: meluncur mulus

-- ---------------------------------------------------------
-- FADE
-- ---------------------------------------------------------
anim("fade", 5, "almostLinear")
anim("fadeIn", 4, "almostLinear")
anim("fadeOut", 3.5, "almostLinear")
anim("fadeSwitch", 5, "almostLinear") -- pergantian fokus
anim("fadeShadow", 5, "almostLinear")
anim("fadeDim", 5, "easeOutQuint") -- dim_inactive berubah mulus
anim("fadeLayers", 4, "almostLinear")

-- ---------------------------------------------------------
-- BORDER
-- ---------------------------------------------------------
anim("border", 7, "easeOutQuint") -- transisi warna saat fokus pindah

-- ---------------------------------------------------------
-- WORKSPACES
-- ---------------------------------------------------------
anim("workspaces", 5, "easeOutExpo", "slidefade 20%") -- geser + fade
anim("specialWorkspace", 5, "easeOutExpo", "slidefadevert 20%") -- scratchpad turun dari atas

-- ---------------------------------------------------------
-- LAYERS (Rofi, Waybar, Mako, SwayOSD)
-- ---------------------------------------------------------
-- Memakai "fade", BUKAN "popin": area blur layer tidak ikut mengecil,
-- sehingga popin + blur menampilkan bingkai keruh yang melebar di
-- sekeliling Rofi/OSD saat muncul.
anim("layers", 4, "easeOutQuint", "fade")
anim("layersOut", 3, "easeOutQuint", "fade")
