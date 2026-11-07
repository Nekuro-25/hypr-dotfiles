-- =========================================================
-- SESSION KEYBINDS
-- =========================================================

-- SUPER + SHIFT + CTRL + Q → Exit Hyprland
-- Sengaja dibuat jauh dari SUPER + Q (tutup jendela) supaya tidak
-- kepencet. Cara lain keluar: SUPER + X → Logout.
-- SUPER + SHIFT + CTRL + Q → Exit Hyprland (graceful via UWSM)
hl.bind("SUPER + SHIFT + CTRL + Q", hl.dsp.exec_cmd("uwsm stop"), {
	description = "Exit Hyprland session (UWSM)",
})

-- SUPER + SHIFT + ALT + L → Lock session manually
-- (SUPER + SHIFT + L dipakai untuk memindah jendela ke kanan.)
hl.bind("SUPER + SHIFT + ALT + L", hl.dsp.exec_cmd("loginctl lock-session"), {
	description = "Lock session",
})

-- SUPER + F9 → Caffeine: tahan layar tetap hidup (matikan/nyalakan hypridle)
hl.bind("SUPER + F9", hl.dsp.exec_cmd("~/.config/hypr/scripts/caffeine.sh"), {
	description = "Toggle caffeine (disable auto-lock/suspend)",
})
