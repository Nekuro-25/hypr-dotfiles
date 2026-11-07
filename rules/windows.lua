-- =========================================================
-- WINDOW RULES
-- =========================================================
-- Semua rule dipasang lewat rule(): kalau satu rule memakai
-- properti yang tidak dikenal versi Hyprland-mu, rule itu saja
-- yang dilewati (tercatat di log), bukan seluruh file.
-- =========================================================

local function rule(t)
	local ok, err = pcall(hl.window_rule, t)
	if not ok then
		print("[windows] rule '" .. tostring(t.name) .. "' dilewati: " .. tostring(err))
	end
end

-- =========================================================
-- GLOBAL
-- =========================================================

-- XWayland drag fix
rule({
	name = "fix-xwayland-drags",

	match = {
		class = "^$",
		title = "^$",
		xwayland = true,
		float = true,
		fullscreen = false,
		pin = false,
	},

	no_focus = true,
})

-- Cegah aplikasi memaksa dirinya "maximize" sendiri (merusak tiling)
rule({
	name = "suppress-maximize-events",
	match = { class = ".*" },
	suppress_event = "maximize",
})

-- Jendela fullscreen (video, game, presentasi) mencegah layar mati/terkunci
rule({
	name = "idle-inhibit-fullscreen",
	match = { class = ".*" },
	idle_inhibit = "fullscreen",
})

-- =========================================================
-- WORKSPACE PLACEMENT (cadangan)
-- =========================================================
-- Penempatan aplikasi saat autostart ditangani oleh
-- hl.exec_cmd(..., { workspace = "N silent" }) di config/autostart.lua.
--
-- Rule di bawah hanya cadangan untuk aplikasi yang melakukan fork
-- (PID-nya tidak terlacak) dan juga berlaku bila Discord/Spotify
-- dibuka manual belakangan. "silent" = fokus tidak berpindah.
--
-- Sengaja TIDAK ada rule global untuk kitty/firefox: rule semacam itu
-- melempar setiap jendela baru (mis. SUPER + Enter) ke workspace tetap.
-- =========================================================

-- Workspace 9: Discord
rule({
	name = "workspace-discord",
	match = { class = "^(discord)$" },
	workspace = "9 silent",
})

-- Workspace 10: Spotify
rule({
	name = "workspace-spotify",
	match = { class = "^(spotify|spotify-launcher)$" },
	workspace = "10 silent",
})

-- =========================================================
-- FUNCTIONAL FLOAT RULES
-- =========================================================
-- Dialogs and utility windows that should never be tiled.
-- Classes verified via `hyprctl clients` on this machine
-- (yang bertanda "baru" belum diverifikasi — cek dengan
-- `hyprctl clients` bila tidak mempan).
-- =========================================================

-- Audio control panel -> float, centered
rule({
	name = "float-pavucontrol",
	match = { class = "^(org.pulseaudio.pavucontrol)$" },
	float = true,
	center = true,
	size = { 700, 500 },
})

-- Bluetooth manager -> float, centered
rule({
	name = "float-blueman",
	match = { class = "^(blueman-manager)$" },
	float = true,
	center = true,
	size = { 500, 400 },
})

-- Picture-in-Picture video -> float, pin, bottom-right corner
rule({
	name = "float-pip",
	match = { title = "^(Picture-in-Picture)$" },
	float = true,
	pin = true,
	size = { 400, 225 },
	move = { "100%-420", "100%-245" },
})

-- Scratchpad terminal -> float, centered, dedicated special workspace
rule({
	name = "scratchpad-terminal",
	match = { class = "^(kitty-scratchpad)$" },
	float = true,
	center = true,
	size = { 900, 550 },
	workspace = "special:scratchpad",
})

-- Anotasi screenshot (swappy) -> float, di tengah
rule({
	name = "float-swappy",
	match = { class = "^(swappy)$" },
	float = true,
	center = true,
})

-- (baru) Dialog buka/simpan file dari browser & aplikasi lain
rule({
	name = "float-file-dialogs",
	match = {
		title = "^(Open File|Open Files|Open Folder|Save As|Save File|Choose File|Choose Files|File Upload|Select a File|Select Folder)(.*)$",
	},
	float = true,
	center = true,
	size = { 900, 600 },
})

-- (baru) File picker bawaan xdg-desktop-portal
rule({
	name = "float-portal-picker",
	match = { class = "^(xdg-desktop-portal-gtk|xdg-desktop-portal-kde)$" },
	float = true,
	center = true,
	size = { 900, 600 },
})

-- (baru) Editor jaringan & kalkulator
rule({
	name = "float-utilities",
	match = { class = "^(nm-connection-editor|org.gnome.Calculator|gnome-calculator|qalculate-gtk)$" },
	float = true,
	center = true,
})
