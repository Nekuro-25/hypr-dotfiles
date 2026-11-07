-- =========================================================
-- AUTOSTART MODULE
-- =========================================================
-- Dijalankan sekali saat sesi Hyprland dimulai.
--  * Daemon & service  -> scripts/autostart.sh
--  * Aplikasi workspace -> hl.exec_cmd(cmd, { workspace = "N silent" })
--    ("silent" = jendela mendarat di workspace itu tanpa memindahkan fokus)
--
-- Browser & terminal diambil dari config/apps.lua, jadi ganti
-- aplikasi cukup di satu tempat.
--
-- Catatan: hl.exec_cmd melacak PID proses. Aplikasi yang melakukan
-- fork (Discord/Spotify kadang) bisa lolos — itu sebabnya rules/windows.lua
-- tetap punya rule cadangan untuk keduanya.
-- =========================================================

local apps = require("config.apps")

hl.on("hyprland.start", function()
	-- Daemon: dbus env, wallpaper, waybar, mako, swayosd, fcitx5, cliphist, hypridle, polkit
	hl.exec_cmd("~/.config/hypr/scripts/autostart.sh")

	-- Aplikasi (urutan layout: lihat keybinds/workspace.lua)
	hl.exec_cmd(apps.browser, { workspace = "1 silent" })
	hl.exec_cmd(apps.terminal, { workspace = "2 silent" })
	hl.exec_cmd(apps.terminal, { workspace = "2 silent" })
	hl.exec_cmd(apps.terminal, { workspace = "3 silent" })
	hl.exec_cmd("discord", { workspace = "9 silent" })
	hl.exec_cmd("spotify-launcher", { workspace = "10 silent" })
end)
