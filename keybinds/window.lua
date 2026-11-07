-- =========================================================
-- WINDOW KEYBINDS
-- =========================================================

local mainMod = "SUPER"

-- SUPER + Q → Close window
hl.bind(mainMod .. " + Q", hl.dsp.window.close(), {
	description = "Close active window",
})

-- SUPER + V → Toggle floating
hl.bind(
	mainMod .. " + V",
	hl.dsp.window.float({
		action = "toggle",
	}),
	{
		description = "Toggle floating",
	}
)

-- SUPER + F → Toggle fullscreen
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen(), {
	description = "Toggle fullscreen",
})

-- SUPER + P → Toggle pseudo tile
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo(), {
	description = "Toggle pseudo tile",
})

-- SUPER + ALT + J → Toggle split orientation
hl.bind(mainMod .. " + ALT + J", hl.dsp.layout("togglesplit"), {
	description = "Toggle split orientation",
})

-- SUPER + ALT + K → Tukar posisi dua sisi split
hl.bind(mainMod .. " + ALT + K", hl.dsp.layout("swapsplit"), {
	description = "Swap split sides",
})

-- =========================================================
-- STASH (special workspace "stash")
-- =========================================================
-- Sembunyikan jendela apa pun sementara tanpa menutupnya.
-- (Terpisah dari scratchpad terminal di SUPER + T.)
-- =========================================================

-- SUPER + SHIFT + T → Sembunyikan jendela aktif ke stash
hl.bind(mainMod .. " + SHIFT + T", hl.dsp.window.move({ workspace = "special:stash" }), {
	description = "Hide window to stash",
})

-- SUPER + ALT + T → Tampilkan/sembunyikan stash
hl.bind(mainMod .. " + ALT + T", hl.dsp.workspace.toggle_special("stash"), {
	description = "Toggle stash",
})

-- =========================================================
-- MOUSE
-- =========================================================

-- SUPER + klik kiri + seret → Pindahkan jendela
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), {
	mouse = true,
})

-- SUPER + klik kanan + seret → Ubah ukuran jendela
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), {
	mouse = true,
})
